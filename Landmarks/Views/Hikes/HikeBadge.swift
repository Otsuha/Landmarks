//
//  HikeBadge.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack.init(alignment: .center, spacing: nil, content: {
            Badge.init()
                .frame(width: 300, height: 300, alignment: .center)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100, alignment: .center)
            Text.init(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        })
    }
}

struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
