//
//  ContentView.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2025-10-01.
//

import SwiftUI

let gradientColors: [Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    
    @State var showWalkThrough: Bool = true
        
    var body: some View {
        
        if (showWalkThrough) {
            TabView {
                WelcomePage()
                VStack {
                    FeaturesView()
                        .padding(.bottom, 50)
                    
                    Button("Start Translation", systemImage: "translate") {
                        withAnimation {
                            showWalkThrough = false
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.tint))
                    .foregroundStyle(.white)
                    .padding(.bottom, 50)
                }
            }
            .background(Gradient(colors: gradientColors))
            .tabViewStyle(.page)
            .foregroundStyle(.white)
        } else {
            Translator()
        }

    }
}

#Preview {
    ContentView()
}
