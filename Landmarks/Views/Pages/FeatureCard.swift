//
//  FeatureCard.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        self.landmark.featureImage?
            .resizable()
            .aspectRatio(1.5, contentMode: .fit)
            .overlay(TextOverlay.init(landmark: self.landmark))
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    
    var gradient: LinearGradient {
        LinearGradient.init(
            gradient: Gradient.init(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack.init(alignment: .bottomLeading, content: {
            Rectangle.init().fill(gradient)
            VStack.init(alignment: .leading, spacing: nil, content: {
                Text.init(self.landmark.name)
                    .font(.title)
                    .bold()
                Text.init(self.landmark.park)
            })
            .padding()
        })
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData.init().features[0])
    }
}
