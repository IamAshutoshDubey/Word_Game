//
//  PlayGameViewModel.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import Foundation
import RxSwift
import RxCocoa

struct InputTrigger {
    var correctTrigger:  Observable<Void>
    var wrongTrigger:  Observable<Void>
    var playTrigger: Observable<Void>
}

class PlayGameViewModel {
    private let game: GameType
    private let router: AppRouterType
    
    private let disposeBag = DisposeBag()
    private var input: InputTrigger!
    private var source: ViewControllerType!
    let attmept = PublishSubject<(String,String)>()
    let liveCorrectAttempts = PublishSubject<(Int)>()
    let liveWrongAttempts = PublishSubject<(Int)>()
    
    let gameStartSubject = PublishSubject<(Bool)>()
    
    init(game: GameType, router: AppRouterType) {
        self.game = game
        self.router = router
    }
        
    func setupBinding(input: InputTrigger, source: ViewControllerType) {
        self.input = input
        self.source = source
        input.playTrigger.subscribe(onNext: { [weak self] in
            self?.startGame()
        }).disposed(by: disposeBag)
        
        input.correctTrigger.map{.correct}.bind(to: game.userResponseObservable).disposed(by: disposeBag)
        input.wrongTrigger.map{.wrong}.bind(to: game.userResponseObservable).disposed(by: disposeBag)
        
        game.questionObservable.compactMap {$0}
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] attemptQuestion in
                self?.attmept.onNext((attemptQuestion.questionWord, attemptQuestion.answerWord))
            }).disposed(by: disposeBag)
        
        game.liveScoreObservable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] score in
                self?.liveCorrectAttempts.onNext(score.correctAttempts)
                self?.liveWrongAttempts.onNext(score.wrongAttempts)
            }).disposed(by: disposeBag)
        
        game.gameOverObservable.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] isGameOver in
                self?.gameOver(source, isGameOver: isGameOver)
            }).disposed(by: disposeBag)
    }
    
    private func gameOver(_ source: ViewControllerType, isGameOver: Bool) {
        router.naviagteToGameOverScreen(source: source, isGameOver: isGameOver)
    }
        
    private func startGame() {
        game.startGame(.difficult).observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] _ in
                self?.gameStartSubject.onNext(true)
        }, onError: { [weak self] _ in
            self?.gameStartSubject.onNext(false)
        }).disposed(by: disposeBag)
    }
}
