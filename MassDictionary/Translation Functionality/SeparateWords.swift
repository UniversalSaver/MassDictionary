//
//  SeparateWords.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-04-06.
//

import Foundation
import NaturalLanguage

func separateWords(inputString: String) -> [String] {
    var separatedWords: [String] = []
    
    let tokenizer = NLTokenizer(unit: .word)
    tokenizer.string = inputString
    
    tokenizer.enumerateTokens(in: inputString.startIndex..<inputString.endIndex) { tokenRange, _ in
        separatedWords.append(String(inputString[tokenRange]))
        return true
    }
    
    return separatedWords
}
