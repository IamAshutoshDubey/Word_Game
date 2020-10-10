//
//  Word.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

struct Word: Decodable, Equatable {
    let english: String
    let spanish: String

    private enum CodingKeys: String, CodingKey {
        case english = "text_eng"
        case spanish = "text_spa"
    }
}
