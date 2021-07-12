//
//  MapView.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/2/3.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    // State 存储真实数据。
    @State private var region = MKCoordinateRegion.init()
    
    var body: some View {
        Map.init(coordinateRegion: $region)
            .onAppear(perform: {
                self.setRegion(self.coordinate)
            })
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        self.region = MKCoordinateRegion.init(center: coordinate, span: MKCoordinateSpan.init(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D.init(latitude: 34.011_286, longitude: -116.166_868))
    }
}
