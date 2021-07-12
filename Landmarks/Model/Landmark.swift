//
//  Landmark.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/9.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    var category: Self.Category
    
    private var imageName: String
    
    var image: Image {
        Image.init(self.imageName)
    }
    var featureImage: Image? {
        self.isFeatured ? Image.init(self.imageName + "_feature") : nil
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    private var coordinates: Self.Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D.init(latitude: self.coordinates.latitude, longitude: self.coordinates.longitude)
    }
}
