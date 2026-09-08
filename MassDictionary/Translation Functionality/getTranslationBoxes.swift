//
//  getTranslationBoxes.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-08-29.
//

import UIKit

func getTranslationBoxes(image: UIImage) -> [TranslationBox] {
    var translationBoxes: [TranslationBox] = []
    // TODO
    // Currently filler data just to make something happen with the test image
    translationBoxes.append(TranslationBox(x: 90, y: 135, width: 72, height: 40, type: WordType.noun, translation: "Contemporary"))
    translationBoxes.append(TranslationBox(x: 164, y: 135, width: 55, height: 40, type: WordType.adjective, translation: "Japan"))
    translationBoxes.append(TranslationBox(x: 220, y: 135, width: 60, height: 40, type: WordType.verb, translation: "Haiku"))
    translationBoxes.append(TranslationBox(x: 283, y: 135, width: 60, height: 40, type: WordType.particle, translation: "Anthology"))
    
    //return translationBoxes
    do {
        let translator = try TranslationBuilder(image: image)
        
        try translator.findText()
        
        translator.separateAndTranslateWords()
        
        return translator.outputData
    } catch {
        print("Fuck")
    }
    
    return translationBoxes
}
