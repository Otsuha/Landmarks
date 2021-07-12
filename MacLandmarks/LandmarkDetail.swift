//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by 御前崎悠羽 on 2021/7/12.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        self.modelData.landmarks.firstIndex(where: { $0.id == self.landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            ZStack.init(alignment: Alignment.init(horizontal: .trailing, vertical: .top), content: {
                MapView.init(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(.all, edges: .top)
                    .frame(width: nil, height: 300, alignment: .center)
                
                Button.init("Open in Maps") {
                    let destination: MKMapItem = MKMapItem.init(placemark: MKPlacemark.init(coordinate: self.landmark.locationCoordinate))
                    destination.name = self.landmark.name
                    destination.openInMaps(launchOptions: nil)
                }
                .padding()
            })
            
            VStack.init(alignment: .leading, spacing: 20, content: {
                HStack.init(alignment: .center, spacing: 24, content: {
                    CircleImage.init(image: landmark.image.resizable())
                        .frame(width: 160, height: 160, alignment: .center)
                    
                    // 竖直方向上的视图堆栈，而且栈内的视图是左对齐的。
                    VStack.init(alignment: .leading) {
                        HStack {
                            Text.init(self.landmark.name)
                                .font(.title)
                                .foregroundColor(.primary)
                            FavoriteButton.init(isSet: self.$modelData.landmarks[self.landmarkIndex].isFavorite)
                                .buttonStyle(PlainButtonStyle.init())
                        }
                        
                        VStack.init(alignment: .leading, spacing: nil, content: {
                            Text(landmark.park)
                            Text(landmark.state)
                        })
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                })
                
                Divider.init()
                
                Text.init("About \(landmark.name)")
                    .font(.title2)
                Text.init(landmark.description)
                
            })
            .padding()  // 整个视图栈作为一个整体，上下左右各增加一些间隔。
            .frame(minWidth: nil, idealWidth: nil, maxWidth: 700, minHeight: nil, idealHeight: nil, maxHeight: nil, alignment: .center)
            .offset(x: 0, y: -50)
        }
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData: ModelData = ModelData.init()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData.init().landmarks[0])
            .environmentObject(self.modelData)
            .frame(width: 850, height: 700, alignment: .center)
    }
}
