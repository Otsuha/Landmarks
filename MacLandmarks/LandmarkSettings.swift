//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by 御前崎悠羽 on 2021/7/12.
//

import SwiftUI

struct LandmarkSettings: View {
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        Form.init(content: {
            Picker.init("Map Zoom", selection: self.$zoom) {
                ForEach.init(MapView.Zoom.allCases) { level in
                    Text.init(level.rawValue)
                }
            }
            .pickerStyle(InlinePickerStyle.init())
        })
        .frame(width: 300, height: nil, alignment: .center)
        .navigationTitle("Landmark Settings")
        .padding(80)
    }
}

struct LandmarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSettings()
    }
}
