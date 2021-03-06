//
//  GameTests.swift
//  WordGameTests
//
//  Created by Ashutosh Dubey on 10/10/20.
//

import XCTest
import SwiftyMocky
import RxSwift
import RxCocoa
@testable import WordGame

class GameTests: XCTestCase {

    var wordProvider: WordsProviderTypeMock!
    var sut: Game!
    
    var bag: DisposeBag!
    override func setUpWithError() throws {
        wordProvider = WordsProviderTypeMock()
        sut = Game(wordsProvider: wordProvider)
        bag = DisposeBag()
    }

    override func tearDownWithError() throws {
        sut = nil
        wordProvider = nil
        bag = nil
    }

    func testStartGame()  {
        let exp = expectation(description: "Start Game")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        
        sut.questionObservable.subscribe(onNext: { question in
            exp.fulfill()
        }).disposed(by: bag)
        
        waitForExpectations(timeout: 5) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testPlayCase1() {
        let exp = expectation(description: "Start Play")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        wordProvider.given(.getWordPairs(.any, willReturn: [WordPair(questionWord: "ENG1", answerWord: "SPA1", isCorrectTranslation: false)]))

        sut.liveScoreObservable.skip(1).subscribe(onNext: { score in
            if score.wrongAttempts == 1 && score.correctAttempts == 0 {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        sut.startGame(.easy).subscribe({ _ in
            self.sut.userResponseObservable.onNext(.correct)
        }).disposed(by: bag)
        waitForExpectations(timeout: 5) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testPlayCase2() {
        let exp = expectation(description: "Start Play")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        wordProvider.given(.getWordPairs(.any, willReturn: [WordPair(questionWord: "ENG1", answerWord: "SPA1", isCorrectTranslation: true)]))

        sut.liveScoreObservable.skip(1).subscribe(onNext: { score in
            if score.wrongAttempts == 0 && score.correctAttempts == 1 {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        sut.startGame(.easy).subscribe({ _ in
            self.sut.userResponseObservable.onNext(.correct)
        }).disposed(by: bag)
        waitForExpectations(timeout: 5) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testPlayCase3() {
        let exp = expectation(description: "Start Play")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        wordProvider.given(.getWordPairs(.any, willReturn: [WordPair(questionWord: "ENG1", answerWord: "SPA1", isCorrectTranslation: true)]))

        sut.liveScoreObservable.skip(1).subscribe(onNext: { score in
            if score.wrongAttempts == 1 && score.correctAttempts == 0 {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        sut.startGame(.easy).subscribe({ _ in
            self.sut.userResponseObservable.onNext(.wrong)
        }).disposed(by: bag)
        waitForExpectations(timeout: 5) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testPlayCase4() {
        let exp = expectation(description: "Start Play")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        wordProvider.given(.getWordPairs(.any, willReturn: [WordPair(questionWord: "ENG1", answerWord: "SPA1", isCorrectTranslation: false)]))

        sut.liveScoreObservable.skip(1).subscribe(onNext: { score in
            if score.wrongAttempts == 0 && score.correctAttempts == 1 {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        sut.startGame(.easy).subscribe({ _ in
            self.sut.userResponseObservable.onNext(.wrong)
        }).disposed(by: bag)
        waitForExpectations(timeout: 5) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testPlayDifficultCase1() {
        let exp = expectation(description: "Start Play - Difficult")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        wordProvider.given(.getWordPairs(.any, .any, willReturn: [WordPair(questionWord: "ENG1", answerWord: "SPA1", isCorrectTranslation: true), WordPair(questionWord: "ENG2", answerWord: "SPA2", isCorrectTranslation: true),WordPair(questionWord: "ENG3", answerWord: "SPA3", isCorrectTranslation: true)]))

        sut.liveScoreObservable.skip(1).subscribe(onNext: { score in
            if score.wrongAttempts == 0 && score.correctAttempts == 1 {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        sut.startGame(.difficult).subscribe({ _ in
            self.sut.userResponseObservable.onNext(.correct)
        }).disposed(by: bag)
        waitForExpectations(timeout: 5) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testPlayDifficultCase2() {
        let exp = expectation(description: "Start Play - Difficult")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        wordProvider.given(.getWordPairs(.any, .any, willReturn: [WordPair(questionWord: "ENG1", answerWord: "SPA1", isCorrectTranslation: false), WordPair(questionWord: "ENG2", answerWord: "SPA2", isCorrectTranslation: true),WordPair(questionWord: "ENG3", answerWord: "SPA3", isCorrectTranslation: true)]))

        sut.liveScoreObservable.skip(1).subscribe(onNext: { score in
            if score.wrongAttempts == 0 && score.correctAttempts == 1 {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        sut.startGame(.difficult).subscribe({ _ in
            self.sut.userResponseObservable.onNext(.wrong)
        }).disposed(by: bag)
        waitForExpectations(timeout: 5) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testPlayDifficultCase3() {
        let exp = expectation(description: "Start Play - Difficult")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        wordProvider.given(.getWordPairs(.any, .any, willReturn: [WordPair(questionWord: "ENG1", answerWord: "SPA1", isCorrectTranslation: false), WordPair(questionWord: "ENG2", answerWord: "SPA2", isCorrectTranslation: true),WordPair(questionWord: "ENG3", answerWord: "SPA3", isCorrectTranslation: true)]))

        sut.liveScoreObservable.skip(1).subscribe(onNext: { score in
            if score.wrongAttempts == 1 && score.correctAttempts == 0 {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        sut.startGame(.difficult).subscribe({ _ in
            self.sut.userResponseObservable.onNext(.correct)
        }).disposed(by: bag)
        waitForExpectations(timeout: 5) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testPlayDifficultCase4() {
        let exp = expectation(description: "Start Play - Difficult")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        wordProvider.given(.getWordPairs(.any, .any, willReturn: [WordPair(questionWord: "ENG1", answerWord: "SPA1", isCorrectTranslation: true), WordPair(questionWord: "ENG2", answerWord: "SPA2", isCorrectTranslation: true),WordPair(questionWord: "ENG3", answerWord: "SPA3", isCorrectTranslation: true)]))

        sut.liveScoreObservable.skip(1).subscribe(onNext: { score in
            if score.wrongAttempts == 1 && score.correctAttempts == 0 {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        sut.startGame(.difficult).subscribe({ _ in
            self.sut.userResponseObservable.onNext(.wrong)
        }).disposed(by: bag)
        waitForExpectations(timeout: 5) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testTimeoutOverTime() {
        let exp = expectation(description: "Start Play - TimeOut")
        wordProvider.given(.fetchWords(willReturn: Single.just(true)))
        wordProvider.given(.getWordPairs(.any, .any, willReturn: [WordPair(questionWord: "ENG1", answerWord: "SPA1", isCorrectTranslation: true), WordPair(questionWord: "ENG2", answerWord: "SPA2", isCorrectTranslation: true),WordPair(questionWord: "ENG3", answerWord: "SPA3", isCorrectTranslation: true)]))
        
        sut.gameOverObservable.subscribe(onNext: { isGameOver in
            if isGameOver {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        sut.startGame(.difficult).subscribe({ _ in
            //self.sut.userResponseObservable.onNext(.wrong)
        }).disposed(by: bag)
        
        waitForExpectations(timeout: 20) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
}
