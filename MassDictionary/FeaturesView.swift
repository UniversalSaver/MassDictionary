//
//  FeaturesView.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-04-02.
//

import SwiftUI

struct FeaturesView: View {
    
    @Binding var changeView: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Features")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
                .padding(.top, 100)
            
            FeatureCard(iconName: "camera.fill", description: "Take pictures of text to be translated word by word")
            FeatureCard(iconName: "text.bubble.fill", description: "Get insight on word-choice")
            
            Spacer()
            
            Button("Start Translation", systemImage: "translate") {
                withAnimation {
                    changeView = true
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.tint))
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var hi: Bool = false
    
    if (!hi) {
        FeaturesView(changeView: $hi)
            .frame(maxHeight: .infinity)
            .background(Gradient(colors: gradientColors))
            .foregroundStyle(.white)
    } else {
        Translator()
    }
}
