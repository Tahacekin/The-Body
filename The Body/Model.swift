//
//  Model.swift
//  The Body
//
//  Created by Taha Çekin on 17.04.2021.
//

import SwiftUI
import RealityKit
import Combine

enum ModelCategory: CaseIterable {
    case billiads
    case sports
    case music
    case tools
    
    var labels: String {
        get {
            switch self {
            case .billiads:
               return "Billiards"
            case .sports:
                return "Sports"
            case .music:
                return "Music"
            case .tools:
                return "Tools"
            }
        }
        
        
    }
    
}

class Model {
    var name: String
    var category: ModelCategory
    var thumbnails: UIImage
    var modelEntity: ModelEntity?
    var scaleComp: Float
    
    private var cancellable: AnyCancellable?
    
    init(name: String, category: ModelCategory, scaleComp: Float = 1.0) {
        self.name = name
        self.category = category
        self.thumbnails = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scaleComp = scaleComp
    }
    
    func asyncLoadModelEntity() {
        let filename = self.name + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case.failure(let error): print("Unable to load ModelEntity \(filename). Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
                
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scaleComp
                
                print("ModelEntity for \(self.name) has been loaded")
            })
    }
    
}

struct Models {
    var all: [Model] = []
    
    init() {
        // Toy-billiads
        let roboToy = Model(name: "toy_robot_vintage", category: .billiads, scaleComp: 0.50)
        let planeToy = Model(name: "toy_biplane", category: .billiads, scaleComp: 0.50)
        
        self.all += [roboToy, planeToy]
        
        // Guitar-sports
        let guitar = Model(name: "fender_stratocaster", category: .sports, scaleComp: 0.50)
        
        self.all += [guitar]
        
        // TeaCup-Music
        let teaCup = Model(name: "cup_saucer_set", category: .music, scaleComp: 0.50)
        
        self.all += [teaCup]
        
        //Chair-Tools
        let chair = Model(name: "chair_swan", category: .tools, scaleComp: 0.50)
        
        self.all += [chair]
    }
    func get(category: ModelCategory) -> [Model] {
        return all.filter( {$0.category == category})
    }
    
}


