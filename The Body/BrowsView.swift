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
                ModelsByCategoryGrid(showBrows: $showBrows)
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

struct ModelsByCategoryGrid: View {
    @Binding var showBrows: Bool
    let models = Models()
    
    var body: some View {
        VStack {
            ForEach(ModelCategory.allCases, id: \.self) { category in
                
                if let modelCategory = models.get(category: category) {
                    HorizontalGrid(showBrows: $showBrows, title: category.labels, item: modelCategory)
                }
                
            }
            
        }
    }
}


struct HorizontalGrid: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var showBrows: Bool
    var title: String
    var item: [Model]
    private let gridItemLayout = [GridItem(.fixed(150))]
    
    var body: some View {
        VStack(alignment: .leading) {
            Seperater()
            
            Text(title)
                .font(.title2).bold()
                .padding(.leading, 20)
                .padding(.top, 10)
                .foregroundColor(.blue)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridItemLayout, content: {
                    
                    ForEach(0..<item.count) { index in
                       let model = item[index]
                        
                        ItemButton(model: model) {
                            self.placementSettings.selectedModel = model
                            model.asyncLoadModelEntity()
                            print("You have selected \(model.name)")
                            self.showBrows = false
                        }
                    }
                    
                    
                })
                
            }
            .padding(.leading, 20)
            .padding(.top, 10)
            
        }
    }
}


struct ItemButton: View {
    let model: Model
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Image(uiImage: self.model.thumbnails)
                .resizable()
                .frame(height: 150)
                .aspectRatio(1/1, contentMode: .fit)
                .background(Color(UIColor.secondarySystemFill))
                .cornerRadius(8.0)
        })
    }
}


struct Seperater: View {
    var body: some View {
        Divider()
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
    }
}
