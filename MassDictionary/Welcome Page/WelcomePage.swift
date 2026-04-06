//
//  Untitled.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-04-02.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                
                Image(systemName: "book.pages")
                    .font(.system(size: 80))
                    .foregroundStyle(.white)
            }
            
            Text("Welcome to the\nTranslator App")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("For Learners")
                .font(.title3)
        }
    }
}

#Preview {
    WelcomePage()
}
