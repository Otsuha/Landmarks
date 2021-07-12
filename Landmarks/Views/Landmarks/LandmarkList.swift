//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/9.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly: Bool = false
    @State private var filter: Self.FilterCategory = .all
    @State private var selectedLandmark: Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory {
            self
        }
    }
    
    var filteredLandmarks: [Landmark] {
        self.modelData.landmarks.filter { landmark in
            (!self.showFavoritesOnly || landmark.isFavorite)
                && (self.filter == .all || self.filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title: String = self.filter == .all ? "Landmarks" : self.filter.rawValue
        return self.showFavoritesOnly ? "Favorites \(title)" : title
    }
    
    var index: Int? {
        self.modelData.landmarks.firstIndex { landmark in
            landmark.id == self.selectedLandmark?.id
        }
    }
    
    var body: some View {
        NavigationView {
            List.init(selection: self.$selectedLandmark) {
                Toggle.init(isOn: $showFavoritesOnly, label: {
                    Text.init("Favorites only")
                })
                
                ForEach.init(self.filteredLandmarks) { landmark in
                    NavigationLink.init(destination: LandmarkDetail.init(landmark: landmark), label: {
                        LandmarkRow.init(landmark: landmark)
                    })
                    .tag(landmark)
                }
            }
//            List.init(self.filteredLandmarks) { landmark in
//                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
//                    LandmarkRow.init(landmark: landmark)
//                }
//            }
            .navigationTitle(self.title)
            .frame(minWidth: 300, idealWidth: nil, maxWidth: nil, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
            .toolbar(content: {
                ToolbarItem.init {
                    Menu.init {
                        Picker.init("Category", selection: self.$filter) {
                            ForEach.init(Self.FilterCategory.allCases) { category in
                                Text.init(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(InlinePickerStyle.init())
                        
                        Toggle.init(isOn: self.$showFavoritesOnly, label: {
                            Label.init("Favorites only", systemImage: "star.fill")
                        })
                    } label: {
                        Label.init("Filter", systemImage: "slider.horizontal.3")
                    }

                }
            })
            
            Text.init("Select a Landmark")
        }
        .focusedValue(\.self.selectedLandmark, self.$modelData.landmarks[self.index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach.init(["iPhone XS Max", "iPad Pro (11-inch) (3rd generation)"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice.init(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
        LandmarkList()
            .environmentObject(ModelData.init())
    }
}
