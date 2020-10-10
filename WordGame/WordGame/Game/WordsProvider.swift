//
//  WordsProvider.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import Foundation
import RxSwift

//sourcery: AutoMockable
protocol WordsProviderType {
    func fetchWords() -> Single<Bool>
    func getWordPairs(correctPercentage: Double) -> [WordPair]
    func getWordPairs(maxpairs: Int, correctPercentage: Double) -> [WordPair]
}

class WordsProvider: WordsProviderType {
    private let wordsLoader: WordsLoaderType
    private var words = [Word]()
    
    init(wordsLoader: WordsLoaderType) {
        self.wordsLoader = wordsLoader
    }
    
    func fetchWords() -> Single<Bool> {
        wordsLoader.loadWords().flatMap { [weak self] words -> Single<Bool> in
            self?.words = words
            return Single.just(true)
        }
    }
    
    func getWordPairs(correctPercentage: Double) -> [WordPair] {
        getWordPairs(maxpairs: Int.max, correctPercentage: correctPercentage)
    }
    
    func getWordPairs(maxpairs: Int, correctPercentage: Double) -> [WordPair] {
        let suffeledWords = words.shuffled()
        let subSetLenght = suffeledWords.count > maxpairs ? maxpairs : suffeledWords.count
        let subSetWordPairs = suffeledWords.prefix(subSetLenght)
        //2. Get correct Attempts
        let correctAttemptsLength = Int(floor((Double(subSetWordPairs.count) * correctPercentage/100.0) + 0.5))
        let correctAttempsts = subSetWordPairs.prefix(correctAttemptsLength).map {
            WordPair(questionWord: $0.english, answerWord: $0.spanish, isCorrectTranslation: true)
        }
        //3. Get all Translation words
        let allTranslations = Set(suffeledWords.map{$0.spanish})
        
        //4. Get Incorrect Attempts
        let incorrectAttempsts: [WordPair] = subSetWordPairs.suffix(subSetLenght - correctAttemptsLength).map {
            let translation = allTranslations.subtracting(Set([$0.spanish])).randomElement() ?? $0.spanish
            return WordPair(questionWord: $0.english, answerWord: translation, isCorrectTranslation: translation == $0.spanish)
        }
        return (correctAttempsts + incorrectAttempsts).shuffled()
    }
}

