//
//  ContentView.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/2/3.
//

import SwiftUI

struct ContentView: View {
    
    enum Tab {
        case featured
        case list
    }
    
    @State private var selection: Self.Tab = .featured
    
    var body: some View {
        TabView.init(selection: self.$selection,
                     content:  {
                        CategoryHome.init()
                            .tabItem {
                                Label.init("Featured", systemImage: "star")
                            }
                            .tag(Tab.featured)
                        
                        LandmarkList.init()
                            .tabItem {
                                Label.init("List", systemImage: "list.bullet")
                            }
                            .tag(Tab.list)
                     })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData.init())
    }
}
