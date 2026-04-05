//
//  FeaturesView.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-04-02.
//

import SwiftUI

struct FeaturesView: View {
    
    
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
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var hi: Bool = false
    
    FeaturesView()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
}
