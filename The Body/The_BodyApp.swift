//
//  The_BodyApp.swift
//  The Body
//
//  Created by Taha Çekin on 16.04.2021.
//

import SwiftUI

@main
struct The_BodyApp: App {
    @StateObject var placementSettings = PlacementSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(placementSettings)
        }
    }
}
