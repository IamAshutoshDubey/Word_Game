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
    func startGame()
}

class Game: GameType {
    private let disposeBag = DisposeBag()
    private let liveScore = BehaviorRelay<LiveScore>(value: LiveScore(correctAttempts: 0, wrongAttempts: 0))
    private let currentQuestion = BehaviorRelay<AttemptQuestion?>(value: nil)
    private var allWordPair: [WordPair]!
    private var currentWordPairCount = 0

    var liveScoreObservable: Observable<LiveScore> {liveScore.asObservable()}
    var questionObservable: Observable<AttemptQuestion?> {currentQuestion.asObservable()}
    let userResponseObservable = PublishSubject<UserResponse>()
    
    private let wordsProvider: WordsProviderType
    
    init(wordsProvider: WordsProviderType) {
        self.wordsProvider = wordsProvider
    }
    
    
    func startGame() {
        wordsProvider.fetchWords().subscribe(onSuccess: { [weak self] attempts in
            self?.allWordPair = self?.wordsProvider.getWordPairs(correctPercentage: 25)
            self?.play()
        }, onError: { _ in
            //TODO:
        }).disposed(by: disposeBag)
    }
    
    private func play() {
        userResponseObservable.subscribe(onNext: { [weak self] response in
            guard let weakSelf = self else { return }
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
            weakSelf.liveScore.accept(score)
            weakSelf.currentWordPairCount += 1
            weakSelf.nextQuestion()
        }).disposed(by: disposeBag)
        
        if currentWordPairCount == 0 {
            nextQuestion()
        }
    }
    
    private func nextQuestion() {
        if currentWordPairCount == allWordPair.count {
            currentWordPairCount = 0
            allWordPair = wordsProvider.getWordPairs(correctPercentage: 25)
        }
        let wordpair =  allWordPair[currentWordPairCount]
        currentQuestion.accept(AttemptQuestion(questionWord: wordpair.questionWord, answerWord: wordpair.answerWord))
    }
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
