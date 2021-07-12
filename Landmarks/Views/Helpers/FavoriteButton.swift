//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/10.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button.init(action: {
            self.isSet.toggle()
        }, label: {
            Image.init(systemName: self.isSet ? "star.fill" : "star")
                .foregroundColor(self.isSet ? .yellow : .gray)
        })
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
