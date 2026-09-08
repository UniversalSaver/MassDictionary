//
//  TranslationBox.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-03-18.
//

import SwiftUI

enum WordType {
    case verb, noun, adjective, particle
}

// A translation box with the x, y as the top left corner (?)
struct TranslationBox: Identifiable {
    let id = UUID()
    let x: Int
    let y: Int
    let width: Int
    let height: Int
    let type: WordType
    let translation: String
    
    @State var popup: Bool = false
    
    func getColor() -> Color {
        switch self.type {
        case WordType.verb:
            return Color.indigo
        case WordType.noun:
            return Color.blue
        case WordType.adjective:
            return Color.green
        case WordType.particle:
            return Color.pink
        }
    }
}
