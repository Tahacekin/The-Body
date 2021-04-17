//
//  BrowsView.swift
//  The Body
//
//  Created by Taha Çekin on 17.04.2021.
//

import SwiftUI

struct BrowsView: View {
    @Binding var showBrows: Bool
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                // Going to add
            }
            .navigationBarTitle("Brows", displayMode: .large)
            .navigationBarItems(trailing:
             
             Button(action: {
                self.showBrows.toggle()
              }, label: {
                Text("Done").foregroundColor(Color.blue).bold()
                    
           })
            
            )
        }
        
    }
}
