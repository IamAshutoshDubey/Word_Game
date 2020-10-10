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
    let game: GameType
    
    private let disposeBag = DisposeBag()
    private var input: InputTrigger!
    let attmept = PublishSubject<(String,String)>()
    let liveCorrectAttempts = PublishSubject<(Int)>()
    let liveWrongAttempts = PublishSubject<(Int)>()
    
    let gameStartSubject = PublishSubject<(Bool)>()
    
    init(game: GameType) {
        self.game = game
    }
        
    func setupBinding(input: InputTrigger) {
        self.input = input
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
    }
        
    private func startGame() {
        game.startGame().observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] _ in
                self?.gameStartSubject.onNext(true)
        }, onError: { [weak self] _ in
            self?.gameStartSubject.onNext(false)
        }).disposed(by: disposeBag)
    }
}
