//
//  WordsProviderTests.swift
//  WordGameTests
//
//  Created by Ashutosh Dubey on 10/10/20.
//

import XCTest
import SwiftyMocky
import RxSwift
import RxCocoa
@testable import WordGame

class WordsProviderTests: XCTestCase {

    var wordLoader: WordsLoaderTypeMock!
    var sut: WordsProvider!
    
    var bag: DisposeBag!

    override func setUpWithError() throws {
        wordLoader = WordsLoaderTypeMock()
        sut = WordsProvider(wordsLoader: wordLoader)
        
        bag = DisposeBag()
    }

    override func tearDownWithError() throws {
        sut = nil
        wordLoader = nil
        bag = nil
    }

    func testFetchWordsSuccess() {
        let exp = expectation(description: "Fetch Words response")
        wordLoader.given(.loadWords(willReturn: Single.just([Word(english: "chess", spanish: "ajedrez"),Word(english: "crossword", spanish: "crucigrama")])))
        
        sut.fetchWords().subscribe(onSuccess: { success in
            if success {
                exp.fulfill()
            }
        }).disposed(by: bag)
        
        waitForExpectations(timeout: 10) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testFetchWordsError() {
        let exp = expectation(description: "Fetch Words response")
        wordLoader.given(.loadWords(willReturn: .error(AppError.decoreError)))
        
        sut.fetchWords().subscribe(onError: { error in
                exp.fulfill()
        }).disposed(by: bag)
        
        waitForExpectations(timeout: 10) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testGetWordPairs() {
        let exp = expectation(description: "Get Words response")
        wordLoader.given(.loadWords(willReturn: Single.just([Word(english: "chess", spanish: "ajedrez"),Word(english: "crossword", spanish: "crucigrama")])))
        
        sut.fetchWords().subscribe(onSuccess: { success in
            if success {
                if self.sut.getWordPairs(50.0).count > 0 {
                    exp.fulfill()
                }
            }
        }).disposed(by: bag)
        
        waitForExpectations(timeout: 10) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testGetWordPairsWithPairCountCase1() {
        let exp = expectation(description: "Get Words response")
        wordLoader.given(.loadWords(willReturn: Single.just([Word(english: "chess", spanish: "ajedrez"),Word(english: "crossword", spanish: "crucigrama")])))
        
        sut.fetchWords().subscribe(onSuccess: { success in
            if success {
               
                if self.sut.getWordPairs(5, 50.0).count == 2 {
                    exp.fulfill()
                }
            }
        }).disposed(by: bag)
        
        waitForExpectations(timeout: 10) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
    
    func testGetWordPairsWithPairCountCase2() {
        let exp = expectation(description: "Get Words response")
        wordLoader.given(.loadWords(willReturn: Single.just([Word(english: "chess", spanish: "ajedrez"),Word(english: "crossword", spanish: "crucigrama"), Word(english: "Eng1", spanish: "spa1"),Word(english: "Eng2", spanish: "spa2"), Word(english: "Eng3", spanish: "spa3"), Word(english: "Eng4", spanish: "spa4")])))
        
        sut.fetchWords().subscribe(onSuccess: { success in
            if success {
               
                if self.sut.getWordPairs(3, 50.0).count == 3 {
                    exp.fulfill()
                }
            }
        }).disposed(by: bag)
        
        waitForExpectations(timeout: 10) {
            if $0 != nil { XCTFail("Expectation not fulfilled") }
        }
    }
}
