//
//  PlacementSettings.swift
//  The Body
//
//  Created by Taha Çekin on 18.04.2021.
//

import SwiftUI
import RealityKit
import Combine


class PlacementSettings: ObservableObject {
    @Published var selectedModel: Model? {
        willSet(newValue) {
            print("Setting selctModel to \(String(describing: newValue?.name))")
        }
    }
    
    @Published var confirmedModel: Model? {
        willSet(newValue) {
            guard let model = newValue else {
                print("Clearing Confirmed Model")
                return
            }
            print("Settinf Confirmed to \(model.name)")
        
        }
    }
    
    var sceneEventView: Cancellable?
    
}
