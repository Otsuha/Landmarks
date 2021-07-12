//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                PageView.init(pages: self.modelData.features.map({ landmark in
                    FeatureCard.init(landmark: landmark)
                }))
                .aspectRatio(1.5, contentMode: .fit)
                .listRowInsets(EdgeInsets.init())
                
                ForEach.init(self.modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow.init(categoryName: key, items: self.modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets.init())
            }
            .listStyle(InsetListStyle.init())
            .navigationTitle("Featured")
            .toolbar(content: {
                Button.init(action: {
                    self.showingProfile.toggle()
                }, label: {
                    Image.init(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                })
            })
            .sheet(isPresented: self.$showingProfile, content: {
                ProfileHost.init()
                    .environmentObject(self.modelData)
            })
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData.init())
    }
}
