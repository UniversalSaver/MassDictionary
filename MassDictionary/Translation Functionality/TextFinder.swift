//
//  TextFinder.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-08-13.
//

import Vision
import SwiftUI

func findText(image: UIImage) /*Change to return things*/ {
    
    if let actualImage = image.cgImage {
        
        let requestHandler = VNImageRequestHandler(cgImage: actualImage)
        let request = VNRecognizeTextRequest()
        
        request.automaticallyDetectsLanguage = false
        request.recognitionLanguages = ["ja"]
        
        do {
            try requestHandler.perform([request])
        } catch {
            print("Unable to process request \(error).")
        }        
    }
    return
}
