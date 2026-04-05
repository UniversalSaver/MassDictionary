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
    
    @State var changeView: Bool = false
        
    var body: some View {
        
        if (!changeView) {
            TabView {
                WelcomePage()
                FeaturesView(changeView: $changeView)
                    .padding(.bottom, 50)
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
