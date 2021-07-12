//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/2/3.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // @StateObject 声明的变量在整个 app 生命周期中只初始化一次。
    @StateObject private var modelData: ModelData = ModelData.init()
    
    var body: some Scene {
        let mainWindow: WindowGroup = WindowGroup.init {
            ContentView.init()
                .environmentObject(self.modelData)
        }
        
        #if os(macOS)
        mainWindow
            .commands {
                LandmarkCommands.init()
            }
        #else
        mainWindow
        #endif
        
        #if os(macOS)
        Settings.init {
            LandmarkSettings.init()
        }
        #endif
    }
}
