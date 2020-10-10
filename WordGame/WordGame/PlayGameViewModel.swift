//
//  PlayGameViewModel.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import Foundation
import RxSwift

struct PlayGameViewModel {
    let game: GameType
    
    private let disposeBag = DisposeBag()
    let attmept = PublishSubject<(String,String)>()
    let liveCorrectAttempts = PublishSubject<(Int)>()
    let liveWrongAttempts = PublishSubject<(Int)>()
    
    init(game: GameType) {
        self.game = game
    }
    
    func setupBinding(correctObervable: Observable<Void>, wrongObervable: Observable<Void>) {
        correctObervable.map{.correct}.bind(to: game.userResponseObservable).disposed(by: disposeBag)
        wrongObervable.map{.wrong}.bind(to: game.userResponseObservable).disposed(by: disposeBag)
        
        game.questionObservable.compactMap {$0}
            .subscribe(onNext: { attemptQuestion in
                attmept.onNext((attemptQuestion.questionWord,attemptQuestion.answerWord))
            }).disposed(by: disposeBag)
        
        game.liveScoreObservable.subscribe(onNext: { score in
            liveCorrectAttempts.onNext(score.correctAttempts)
            liveWrongAttempts.onNext(score.wrongAttempts)
        }).disposed(by: disposeBag)
    }
    
    func startGame() {
        game.startGame()
    }
}
