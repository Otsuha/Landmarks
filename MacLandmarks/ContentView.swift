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
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData.init())
    }
}
