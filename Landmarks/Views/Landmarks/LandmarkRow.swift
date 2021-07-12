//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/9.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            self.landmark.image
                .resizable()
                .frame(width: 50, height: 50, alignment: .leading)
                .cornerRadius(5)
            VStack.init(alignment: .leading, spacing: nil, content: {
                Text(self.landmark.name)
                    .bold()
                Text.init(self.landmark.park)
                    .font(.caption)
                    .foregroundColor(.secondary)
            })
            
            Spacer.init()
            
            if self.landmark.isFavorite {
                Image.init(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks: Array<Landmark> = ModelData.init().landmarks
    
    static var previews: some View {
        Group {
            LandmarkRow.init(landmark: self.landmarks[0])
            LandmarkRow(landmark: self.landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
