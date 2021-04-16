//
//  ControlView.swift
//  The Body
//
//  Created by Taha Çekin on 16.04.2021.
//

import SwiftUI

struct BottomView: View {
    var body: some View {
        VStack {
           SwitchButton()
            Spacer()
            ControlView()
        }
    }
}

struct SwitchButton: View {
    var body: some View {
        HStack {
            ButtonView(sfSymbol: "clock.fill") {
                print("Recents")
            }
            ButtonView(sfSymbol: "square.grid.2x2") {
                print("Main Menu")
            }
            
            ButtonView(sfSymbol: "slider.horizontale.3") {
                print("Settings")
            }
        }
    }
    
}

struct ControlView: View {
    var body: some View {
        HStack {
            ButtonView(sfSymbol: "clock.fill") {
                print("Recents")
            }
            ButtonView(sfSymbol: "square.grid.2x2") {
                print("Main Menu")
            }
            
            ButtonView(sfSymbol: "slider.horizontale.3") {
                print("Settings")
            }
        }
        .frame(maxWidth: 500)
        .padding(30)
        .foregroundColor(Color.black.opacity(0.25))
      
    }
}

struct ButtonView: View {
    let sfSymbol: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(systemName: sfSymbol)
                .font(.system(size: 35))
                .foregroundColor(Color.white)
                .buttonStyle(PlainButtonStyle())
        })
      
    }
}
