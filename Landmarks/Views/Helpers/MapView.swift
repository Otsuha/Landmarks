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
    
    @AppStorage("MapView.zoom") private var zoom: Self.Zoom = .medium
    
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            return self
        }
    }
    
    var delta: CLLocationDegrees {
        switch self.zoom {
        case .near:
            return 0.02
        case .medium:
            return 0.2
        case .far:
            return 2
        }
    }
    
    var body: some View {
        Map.init(coordinateRegion: .constant(self.region))
    }
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion.init(
            center: self.coordinate,
            span: MKCoordinateSpan.init(latitudeDelta: self.delta, longitudeDelta: self.delta)
        )
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D.init(latitude: 34.011_286, longitude: -116.166_868))
    }
}
