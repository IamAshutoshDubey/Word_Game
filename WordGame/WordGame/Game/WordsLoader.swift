//
//  WordsLoader.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import Foundation
import RxSwift

private let _wordFileName = "words"

//sourcery: AutoMockable
protocol WordsLoaderType {
    func loadWords() -> Single<[Word]>
}

struct WordsLoader: WordsLoaderType {
    
    func loadWords() -> Single<[Word]> {
        if let url = Bundle.main.url(forResource: _wordFileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let wordList = try JSONDecoder().decode([Word].self, from: data)
                return wordList.isEmpty ? .error(LoaderError.noElements) : .just(wordList)
            } catch {
                return .error(LoaderError.decoreError)
            }
        } else {
            return .error(LoaderError.fileNotFound)
        }
    }
}

enum LoaderError: Error {
    case decoreError
    case noElements
    case fileNotFound
}

extension LoaderError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decoreError:
            return "Could not decode json data."
        case .noElements:
            return "No elements available. Please add some words in the data source."
        case .fileNotFound:
            return "File not found. Please check your URL."
        }
    }
}
