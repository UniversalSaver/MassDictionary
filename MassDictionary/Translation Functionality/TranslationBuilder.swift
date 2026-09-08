//
//  TranslationBuilder.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-08-29.
//

import Foundation
import Vision
import UIKit
import CoreFoundation
import NaturalLanguage

enum TranslationError: Error {
    case badImageError
    case imageNotProcessed
}

class TranslationBuilder {
    var requestHandler: VNImageRequestHandler
    var request: VNRecognizeTextRequest
    var processData: [VNRecognizedText]
    var outputData: [TranslationBox]
    
    init(image: UIImage) throws {
        self.request = VNRecognizeTextRequest()
        request.automaticallyDetectsLanguage = false
        request.recognitionLanguages = ["ja"]
        
        if let cgImage = image.cgImage {
            self.requestHandler = VNImageRequestHandler(cgImage: cgImage)
        } else {
            throw TranslationError.badImageError
        }
        
        self.processData = []
        self.outputData = []
    }
    
    func findText() throws {
        do {
            try requestHandler.perform([request])
        } catch {
            print("Had an error finding text: \(error)")
        }
        
        guard let validObservations = request.results else {
            throw TranslationError.imageNotProcessed
        }
        
        self.processData = validObservations.compactMap { observation in
            return observation.topCandidates(5).first
        }
    }
    
    func separateAndTranslateWords() {
        let tokenizer: NLTokenizer = NLTokenizer(unit: NLTokenUnit.word)

        for VNText in processData {
                            
            tokenizer.string = VNText.string
            tokenizer.setLanguage(NLLanguage.japanese)
            
            let words = tokenizer.tokens(for:VNText.string.startIndex..<VNText.string.endIndex)
            
            for word in words {
                do {
                    if let rectangle: VNRectangleObservation = try VNText.boundingBox(for: word) {
                        outputData.append(TranslationBox(x: Int(rectangle.topLeft.x), y: Int(rectangle.topLeft.y),
                                                         width: Int(rectangle.topRight.x) - Int(rectangle.topLeft.x),
                                                         height: Int(rectangle.bottomLeft.y) - Int(rectangle.topLeft.y), type: WordType.adjective, translation: "owo"))
                        print("word: \(word)")
                        print("value: \(VNText.string[word])")
                        print("x: \(rectangle.topLeft)")
                        print("y: \(rectangle.topLeft)")

                    }
                    
                } catch {
                    print("Fuck")
                }
            }
        }
    }
}
