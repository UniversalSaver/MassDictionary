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
        
    var body: some View {
        TabView {
            WelcomePage()
            FeaturesView()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)

    }
}

#Preview {
    ContentView()
}
