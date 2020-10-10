//
//  PlayGameViewModelTests.swift
//  WordGameTests
//
//  Created by Ashutosh Dubey on 10/10/20.
//

import XCTest
import SwiftyMocky
import RxSwift
import RxCocoa
@testable import WordGame

class PlayGameViewModelTests: XCTestCase {

    var sut: PlayGameViewModel!
    var mockedGame: GameTypeMock!
    var router: AppRouterTypeMock!
    
    private var bag: DisposeBag!
    private var correctObervable: PublishSubject<Void>!
    private var wrongObervable:  PublishSubject<Void>!
    private var playObervable:  PublishSubject<Void>!
    private var gameOverSubject: PublishSubject<Bool>!


    override func setUpWithError() throws {
        bag = DisposeBag()
        mockedGame = GameTypeMock()
        router = AppRouterTypeMock()
        sut = PlayGameViewModel(game: mockedGame, router: router)
        correctObervable = PublishSubject<Void>()
        wrongObervable =  PublishSubject<Void>()
        playObervable =  PublishSubject<Void>()
        let inputTrigger = InputTrigger(correctTrigger: correctObervable.asObservable(),
                     wrongTrigger: wrongObervable.asObservable(),
                     playTrigger: playObervable.asObservable())
        
        gameOverSubject =  PublishSubject<Bool>()
        
        mockedGame.given(.questionObservable(getter: PublishSubject<AttemptQuestion?>().asObservable()))
        mockedGame.given(.liveScoreObservable(getter: PublishSubject<LiveScore>().asObservable()))
        mockedGame.given(.userResponseObservable(getter: PublishSubject<UserResponse>()))
        mockedGame.given(.gameOverObservable(getter: gameOverSubject.asObservable()))

        sut.setupBinding(input: inputTrigger, source: ViewControllerTypeMock())
    }

    override func tearDownWithError() throws {
        sut = nil
        bag = nil
        mockedGame = nil
    }
    
    func testStartGame() {
        mockedGame.given(.startGame(.any, willReturn: Single.just(())))
        let exp = expectation(description: "Play Game")
        sut.gameStartSubject.subscribe(onNext: { status in
            if status {
                exp.fulfill()
            }
        }).disposed(by: bag)
        playObervable.onNext(())
        
        waitForExpectations(timeout: 10) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }

    func testBindingCorrectResponse() {
        let exp = expectation(description: "Correct Resposnse")
        mockedGame.userResponseObservable.subscribe(onNext: { response in
            if response == .correct {
                exp.fulfill()
            }
        }).disposed(by: bag)
        correctObervable.onNext(())
        waitForExpectations(timeout: 10) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testBindingWrongResponse() {
        let exp = expectation(description: "Wrong Resposnse")
        mockedGame.userResponseObservable.subscribe(onNext: { response in
            if response == .wrong {
                exp.fulfill()
            }
        }).disposed(by: bag)
        wrongObervable.onNext(())
        waitForExpectations(timeout: 10) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testGameOver() {
        gameOverSubject.onNext(true)
        router.verify(.naviagteToGameOverScreen(source: .any, isGameOver: .any), count: 1)
    }
}
