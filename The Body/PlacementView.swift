//
//  PlacementView.swift
//  The Body
//
//  Created by Taha Çekin on 18.04.2021.
//

import SwiftUI

struct PlacementView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    
    var body: some View {
        HStack {
            Spacer()
            
            PlacementButtons(sfSymbols: "xmark.circle.fill") {
                self.placementSettings.selectedModel = nil
            }
            
            Spacer()
            
            PlacementButtons(sfSymbols: "checkmark.circle.fill") {
                self.placementSettings.confirmedModel = self.placementSettings.selectedModel
                self.placementSettings.selectedModel = nil
            }
            Spacer()
        }
        .padding(.bottom, 30)
    }
}

struct PlacementButtons: View {
    let sfSymbols: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(systemName: sfSymbols)
                .font(.system(size: 50, weight: .light, design: .default))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }).frame(width: 75, height: 75)
    }
}
