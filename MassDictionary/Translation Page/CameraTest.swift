//
//  CameraTest.swift
//  MassDictionary
//
//  Created by Nabhan Rashid on 2026-08-13.
//

import SwiftUI

struct CameraTest: View {
    
    @State var showingCamera = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        Button(action: {
            showingCamera = true
        }) {Text("Take photo")}
            .padding()
            .background(.tint, in: RoundedRectangle( cornerRadius: 8.0))
            .foregroundStyle(.white)
            .sheet(isPresented: $showingCamera) {
                CameraView(image: $selectedImage)
            }
    }
}

#Preview {
    CameraTest()
}
