//
//  ContentView.swift
//  The Body
//
//  Created by Taha Çekin on 16.04.2021.
//

import SwiftUI
import RealityKit

struct ContentView: View {
@State private var isControlBarVisible = true
@State private var showBrows = false
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
           
            ControlView(isControlBarVisible: $isControlBarVisible, showBrows: $showBrows)
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
