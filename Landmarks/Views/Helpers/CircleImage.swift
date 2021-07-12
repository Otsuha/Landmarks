//
//  CircleImage.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/2/3.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        self.image
            .clipShape(Circle.init())  // 添加圆形蒙版。
            .overlay(Circle.init().stroke(Color.white, lineWidth: 4))  // 为圆形添加黑色边框线。
            .shadow(radius: 7)  // 为圆形添加阴影。
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image.init("turtlerock"))
    }
}
