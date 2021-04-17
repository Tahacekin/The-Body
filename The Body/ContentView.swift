//
//  ContentView.swift
//  The Body
//
//  Created by Taha Çekin on 16.04.2021.
//

import SwiftUI
import RealityKit

struct ContentView: View {
@EnvironmentObject var placementSettings: PlacementSettings
    
    
    @State private var isControlBarVisible = true
    @State private var showBrows = false
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            
            if self.placementSettings.selectedModel == nil {
                ControlView(isControlBarVisible: $isControlBarVisible, showBrows: $showBrows)
            } else {
                PlacementView()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var placementSettings: PlacementSettings
    
    func makeUIView(context: Context) -> CustomARView {
        
        let arView = CustomARView(frame: .zero)
        self.placementSettings.sceneEventView = arView.scene.subscribe(to: SceneEvents.Update.self, { (event) in
            self.updateScene(for: arView)
        })
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: CustomARView, context: Context) {}
    
    private func updateScene(for arView: CustomARView) {
        
        arView.focusEntity?.isEnabled = self.placementSettings.selectedModel != nil
        
        if let confirmedModel = self.placementSettings.confirmedModel, let modelEntity = confirmedModel.modelEntity {
           
            self.place(modelEntity, in: arView)
            
            self.placementSettings.confirmedModel = nil
        }
    }
    
    private func place(_ modelEntity: ModelEntity, in arView: ARView) {
        let cloneEntity = modelEntity.clone(recursive: true)
       
        cloneEntity.generateCollisionShapes(recursive: true)
        arView.installGestures([.translation, .rotation], for: cloneEntity)
        
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(cloneEntity)
        
        arView.scene.addAnchor(anchorEntity)
        
        print("Added model Entity to scene")
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlacementSettings())
    }
}
