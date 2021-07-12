//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/12.
//

import SwiftUI

struct LandmarkCommands: Commands {
    private struct MenuContent: View {
        @FocusedBinding(\.selectedLandmark) var selectedLandmark
        
        var body: some View {
            Button.init("\(self.selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                self.selectedLandmark?.isFavorite.toggle()
            }
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(self.selectedLandmark == nil)
        }
    }
    
    var body: some Commands {
        SidebarCommands.init()
        CommandMenu.init("Landmark") {
            Self.MenuContent.init()
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get {
            self[SelectedLandmarkKey.self]
        }
        set {
            self[SelectedLandmarkKey.self] = newValue
        }
    }
}
