//
//  ContentView.swift
//  MacLandmarks
//
//  Created by 御前崎悠羽 on 2021/7/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList.init()
            .frame(minWidth: 700, idealWidth: nil, maxWidth: nil, minHeight: 300, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: nil, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData.init())
    }
}
