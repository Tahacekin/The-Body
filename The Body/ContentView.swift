//
//  ContentView.swift
//  The Body
//
//  Created by Taha Çekin on 16.04.2021.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            ControlView()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
