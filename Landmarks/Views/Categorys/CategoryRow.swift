//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: Array<Landmark>
    
    var body: some View {
        VStack.init(alignment: .leading, spacing: nil, content: {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView.init(.horizontal, showsIndicators: false, content: {
                HStack.init(alignment: .top, spacing: 0, content: {
                    ForEach.init(self.items) { landmark in
                        NavigationLink.init(
                            destination: LandmarkDetail.init(landmark: landmark),
                            label: {
                                CategoryItem.init(landmark: landmark)
                            })
                    }
                })
            })
            .frame(width: nil, height: 185, alignment: .leading)
        })
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks: Array<Landmark> = ModelData.init().landmarks
    
    static var previews: some View {
        CategoryRow(categoryName: Self.landmarks[0].category.rawValue, items: Array(Self.landmarks.prefix(3)))
    }
}
