//
//  ControlView.swift
//  The Body
//
//  Created by Taha Çekin on 16.04.2021.
//

import SwiftUI

// MARK: ControlView
struct ControlView: View {
    @Binding var isControlBarVisible: Bool
    @Binding var showBrows: Bool
    
    var body: some View {
        VStack {
            ControlWindowView(isControlBarVisible: $isControlBarVisible)
            
            Spacer()
            
            if isControlBarVisible {
                ControlButtonView(showBrows: $showBrows)
            }
        }
    }
}

// MARK: ControlWindowView
struct ControlWindowView: View {
    @Binding var isControlBarVisible: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            ZStack {
                Color.black.opacity(0.25)
                
                Button(action: {
                    print("You hav etapped on the window")
                    self.isControlBarVisible.toggle()
                }, label: {
                    Image(systemName: self.isControlBarVisible ? "rectangle": "slider.horizontal.below.rectangle" )
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                
                })
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8.0)
            
            
            
        }
        .padding(.top, 45)
        .padding(.trailing, 20)
    }
}

// MARK: ControlButtonView
struct ControlButtonView: View {
    @Binding var showBrows: Bool
    
    var body: some View {
        HStack {
            
            // Recnts Button
            ButtonView(buttonImage: "clock.fill") {
                print("You have tapped on the recents button")
            }
            
            Spacer()
            
            // The sheet Button
            ButtonView(buttonImage: "square.grid.2x2") {
                print("You have tapped the sheet")
                self.showBrows.toggle()
            }.sheet(isPresented: $showBrows, content: {
                BrowsView(showBrows: $showBrows)
            })
            
            Spacer()
            
            // The Settings Button
            ButtonView(buttonImage: "slider.horizontal.3") {
                print("You have tapped the settings Button")
            }
            
        }
        .frame(maxWidth: 500)
        .padding(30)
        .foregroundColor(Color.black.opacity(0.45))
        
    }
}

// MARK: ButtonView
struct ButtonView: View {
    let buttonImage: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(systemName: buttonImage)
                .font(.system(size: 35))
                .foregroundColor(Color.white)
                .buttonStyle(PlainButtonStyle())
                .frame(width: 50, height: 50)
        })
        
    }
}


