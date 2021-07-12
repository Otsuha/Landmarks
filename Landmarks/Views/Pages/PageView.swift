//
//  PageView.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: Array<Page>
    @State private var currentPage: Int = 0
    
    var body: some View {
        ZStack.init(alignment: .bottomTrailing, content: {
            PageViewController.init(pages: self.pages, currentPage: self.$currentPage)
            PageControl.init(numberOfPages: self.pages.count, currentPage: self.$currentPage)
                .frame(width: CGFloat.init(self.pages.count * 18), height: nil, alignment: .center)
                .padding(.trailing)
        })
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData.init().features.map( {FeatureCard.init(landmark: $0)} ))
            .aspectRatio(1.5, contentMode: .fit)
    }
}
