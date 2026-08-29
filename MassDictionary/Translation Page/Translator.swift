//
//  Translator.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-04-03.
//

import SwiftUI


struct Translator: View {
    
    @State var showingCamera = false
    @State var selectedImage: UIImage?
    
    @State var translations: [TranslationBox] = []
    
    @State var currentlyTranslating: Bool = false
    @State var currentTranslation: String = ""
    
    var body: some View {
        VStack {
            
            // Display image if valid and not None
            if let validImage = selectedImage {
                Image(uiImage: validImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay() {
                        ForEach(translations) { t in
                            Rectangle()
                                .path(in: CGRect(x: t.x, y: t.y, width: t.width, height: t.height))
                                .stroke(t.getColor(), lineWidth: 4)
                                .fill(t.getColor().opacity(0.5))
                                .onTapGesture {
                                    print("Pushed \(t.getColor())")
                                    currentTranslation = t.translation
                                    currentlyTranslating = true
                                }
                        }
                    }
                    .border(.white, width: 3)
            }
            Spacer()
            
            // Button to show the image and translate it (Currently just a test image)
            Button("Show Image & Translate") {
                withAnimation {
                    selectedImage = UIImage(named: "Test Image")
                    
                    translations.append(TranslationBox(x: 90, y: 135, width: 72, height: 40, type: WordType.noun, translation: "Contemporary"))
                    translations.append(TranslationBox(x: 164, y: 135, width: 55, height: 40, type: WordType.adjective, translation: "Japan"))
                    translations.append(TranslationBox(x: 220, y: 135, width: 60, height: 40, type: WordType.verb, translation: "Haiku"))
                    translations.append(TranslationBox(x: 283, y: 135, width: 60, height: 40, type: WordType.particle, translation: "Anthology"))
                }
                
            }
            .padding()
            .background(Color.orange, in: RoundedRectangle( cornerRadius: 8.0))

            // Button to take an image using the camera
            Button(action: {
                showingCamera = true
            }) {Text("Take photo")}
                .padding()
                .background(.tint, in: RoundedRectangle( cornerRadius: 8.0))
                .foregroundStyle(.white)
                .sheet(isPresented: $showingCamera) {
                    CameraView(image: $selectedImage)
                }
            
            // Shows the translation of the current word selected
            ScrollView {
                if (currentlyTranslating) {
                    Text(currentTranslation)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .border(.white, width: 3)
            .background(.gray)
        }
        .padding()
        .contentShape(Rectangle())
        .background(.black)
        .onTapGesture {
            print("Stop Translating")
            currentlyTranslating = false
        }
    }
}

#Preview {
    Translator()
}
