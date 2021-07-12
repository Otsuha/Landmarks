//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack.init(alignment: .leading, spacing: nil, content: {
            self.landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155, alignment: .center)
                .cornerRadius(5)
            Text.init(self.landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        })
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData.init().landmarks[0])
    }
}
