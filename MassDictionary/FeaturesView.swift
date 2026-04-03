//
//  FeaturesView.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-04-02.
//

import SwiftUI

struct FeaturesView: View {
    var body: some View {
        VStack {
            Text("Features")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            FeatureCard(iconName: "camera.fill", description: "Take pictures of text to be translated word by word")
            FeatureCard(iconName: "text.bubble.fill", description: "Get insight on word-choice")
        }
        .padding()
    }
}

#Preview {
    FeaturesView()
}
