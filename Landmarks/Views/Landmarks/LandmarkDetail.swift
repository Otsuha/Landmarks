//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/10.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        self.modelData.landmarks.firstIndex(where: { $0.id == self.landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView.init(coordinate: self.landmark.locationCoordinate)
                .ignoresSafeArea(.all, edges: .top)
                .frame(width: nil, height: 300, alignment: .center)
            
            CircleImage.init(image: self.landmark.image)
                .offset(x: 0, y: -130)  // 向上偏移。
                .padding(.bottom, -130)  // 这个圆形视图的下方的视图和它的距离缩小。
            
            // 竖直方向上的视图堆栈，而且栈内的视图是左对齐的。
            VStack.init(alignment: .leading) {
                HStack {
                    Text.init(self.landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton.init(isSet: self.$modelData.landmarks[self.landmarkIndex].isFavorite)
                }
                
                // 在竖直视图方向的视图栈内又嵌入水平方向的视图栈。
                HStack {
                    Text(self.landmark.park)
                        .font(.subheadline)
                    Spacer()  // 一个间隙，间隙值系统灵活计算。方向根据堆栈视图的方向判断。
                    Text(self.landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider.init()
                
                Text.init("About \(landmark.name)")
                    .font(.title2)
                Text.init(landmark.description)
            }
            .padding()  // 整个视图栈作为一个整体，上下左右各增加一些间隔。
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData: ModelData = ModelData.init()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData.init().landmarks[0])
            .environmentObject(self.modelData)
    }
}
