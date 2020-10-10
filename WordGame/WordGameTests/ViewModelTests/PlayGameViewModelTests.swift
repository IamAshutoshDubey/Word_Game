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
    
    var bag: DisposeBag!
    var correctObervable: PublishSubject<Void>!
    var wrongObervable:  PublishSubject<Void>!

    override func setUpWithError() throws {
        bag = DisposeBag()
        mockedGame = GameTypeMock()
        sut = PlayGameViewModel(game: mockedGame)
        correctObervable = PublishSubject<Void>()
        wrongObervable =  PublishSubject<Void>()
        sut.setupBinding(correctObervable: correctObervable.asObservable() , wrongObervable: wrongObervable.asObservable())
    }

    override func tearDownWithError() throws {
        sut = nil
        bag = nil
       // mockedGame = nil
    }

//    func testBinding() {
////        let exp = expectation(description: "Correct Resposnse")
////        mockedGame.userResponseObservable.subscribe(onNext: { response in
////            if response == .correct {
////                exp.fulfill()
////            }
////        }).disposed(by: bag)
////
////        correctObervable.onNext(())
////
////        waitForExpectations(timeout: 10) {
////            if $0 != nil { XCTFail("Expectation not fulfilled") }
////        }
//    }
}
