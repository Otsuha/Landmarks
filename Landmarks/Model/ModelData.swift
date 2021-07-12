//
//  ModelData.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/9.
//

import Foundation

//var landmarks: Array<Landmark> = load("landmarkData.json")
final class ModelData: ObservableObject {  // 添加观察者，当观察者内数据有任何变化时，观察者需要发布（Published）对其数据的任何更改。
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile: Profile = Profile.default
    
    var features: Array<Landmark> {
        self.landmarks.filter({ $0.isFeatured })
    }
    
    var categories: Dictionary<String, Array<Landmark>> {
        Dictionary.init(grouping: self.landmarks, by: { $0.category.rawValue })
    }
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    do {
        data = try Data.init(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decoder: JSONDecoder = JSONDecoder.init()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
