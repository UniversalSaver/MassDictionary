//
//  ContentView.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2025-10-01.
//

import SwiftUI

struct ContentView: View {
    
    @State private var myImage = "Nothing"
    @State private var translations: [TranslationBox] = []
    
    var body: some View {
        
        
        VStack {
            
            ZStack {
                Image(myImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                ForEach(0..<translations.count, id: \.description) { i in
                    Rectangle()
                        .path(in: CGRect(x: translations[i].x, y: translations[i].y, width: translations[i].width, height: translations[i].height))
                        .stroke(translations[i].getColor(), lineWidth: 4)
                        .fill(translations[i].getColor().opacity(0.5))
                }

            }
            
            Spacer()
            
            Button("Show Image & Translate") {
                withAnimation {
                    myImage = "Test Image"
                    
                    translations.append(TranslationBox(x: 90, y: 335, width: 72, height: 40, type: WordType.noun))
                    translations.append(TranslationBox(x: 164, y: 335, width: 55, height: 40, type: WordType.adjective))
                    translations.append(TranslationBox(x: 220, y: 335, width: 60, height: 40, type: WordType.verb))
                    translations.append(TranslationBox(x: 283, y: 335, width: 60, height: 40, type: WordType.particle))
                }
                
            }
            .padding()
            .background(Color.orange, in: RoundedRectangle( cornerRadius: 8.0))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
