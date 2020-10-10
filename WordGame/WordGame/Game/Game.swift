//
//  Game.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import Foundation
import RxSwift
import RxRelay

//sourcery: AutoMockable
protocol GameType {
    var liveScoreObservable: Observable<LiveScore> {get}
    var questionObservable: Observable<AttemptQuestion?> {get}
    var userResponseObservable: PublishSubject<UserResponse> {get}
    var gameOverObservable: Observable<Bool> {get}
    func startGame(_ mode: GameMode) -> Single<Void>
}

class Game: GameType {
    
    private let correctPercentage = 25.0
    private let maxWordPairs = 15
    private let maxFailedAttempt = 3
    private let timeoutTime: TimeInterval = 5
    
    
    var liveScoreObservable: Observable<LiveScore> {liveScore.asObservable()}
    var questionObservable: Observable<AttemptQuestion?> {currentQuestion.asObservable()}
    var userResponseObservable = PublishSubject<UserResponse>()
    var gameOverObservable: Observable<Bool> {gameOverSubject.asObservable()}
    
    private let liveScore = BehaviorRelay<LiveScore>(value: LiveScore(correctAttempts: 0, wrongAttempts: 0))
    private let currentQuestion = BehaviorRelay<AttemptQuestion?>(value: nil)
    private let startGameSubject = PublishSubject<Bool>()
    private var allWordPair: [WordPair]!
    private var currentWordPairCount = 0
    private var gameOverSubject = PublishSubject<Bool>()
    private var gameMode: GameMode = .difficult
    private var timer: Timer!
    
    private let disposeBag = DisposeBag()
    
    private let wordsProvider: WordsProviderType
    
    init(wordsProvider: WordsProviderType) {
        self.wordsProvider = wordsProvider
    }
    
    func startGame(_ mode: GameMode) -> Single<Void> {
        gameMode = mode
        return wordsProvider.fetchWords().subscribeOn(ConcurrentDispatchQueueScheduler(qos: .default))
            .observeOn(MainScheduler.instance)
            .flatMap { [weak self] success -> Single<Void> in
                guard let weakSelf = self else { return .error(AppError.generic) }
                weakSelf.allWordPair = weakSelf.fetchWordPairs()
                weakSelf.play()
                return Single.just(())
            }
    }
    
    private func play() {
        userResponseObservable.subscribe(onNext: { [weak self] response in
            guard let weakSelf = self else { return }
            DispatchQueue.main.async {
                weakSelf.timer?.invalidate()
            }
            let wordPair =  weakSelf.allWordPair[weakSelf.currentWordPairCount]
            var score = weakSelf.liveScore.value
            if response == .correct {
                if wordPair.isCorrectTranslation {
                    score.correctAttempts += 1
                } else {
                    score.wrongAttempts += 1
                }
            } else {
                if !wordPair.isCorrectTranslation {
                    score.correctAttempts += 1
                } else {
                    score.wrongAttempts += 1
                }
            }
            weakSelf.processLiveScore(score: score)
            
        }).disposed(by: disposeBag)
        
        if currentWordPairCount == 0 {
            nextQuestion()
        }
    }
    
    private func nextQuestion() {
        let wordpair =  allWordPair[currentWordPairCount]
        currentQuestion.accept(AttemptQuestion(questionWord: wordpair.questionWord, answerWord: wordpair.answerWord))
        if gameMode == .difficult {
            DispatchQueue.main.async {
                self.timer?.invalidate()
                self.timer = Timer(timeInterval: self.timeoutTime, repeats: false) { [weak self] _ in
                    guard let weakSelf = self else { return }
                    var score = weakSelf.liveScore.value
                    score.wrongAttempts += 1
                    weakSelf.processLiveScore(score: score)
                }
                RunLoop.current.add(self.timer, forMode: RunLoop.Mode.common)
            }
        }
    }
    
    private func processLiveScore(score: LiveScore) {
        currentWordPairCount += 1
        switch gameMode {
        case .difficult:
            if score.wrongAttempts == maxFailedAttempt {
                gameOverSubject.onNext((true))
            } else if currentWordPairCount == maxWordPairs {
                gameOverSubject.onNext((false))
            } else {
                liveScore.accept(score)
                nextQuestion()
            }
        case .easy:
            if currentWordPairCount == allWordPair.count {
                currentWordPairCount = 0
                allWordPair = fetchWordPairs()
            }
            liveScore.accept(score)
            nextQuestion()
        }
    }
    
    private func fetchWordPairs() -> [WordPair] {
        if gameMode == .easy {
            return wordsProvider.getWordPairs(correctPercentage)
        } else {
            return wordsProvider.getWordPairs(maxWordPairs, correctPercentage)
        }
    }
}

enum GameMode {
    case difficult
    case easy
}


struct LiveScore {
    var correctAttempts: Int = 0
    var wrongAttempts: Int = 0
}

struct AttemptQuestion {
    let questionWord: String
    let answerWord: String
}

enum UserResponse {
    case correct
    case wrong
}
