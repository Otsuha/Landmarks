//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView.init(content: {
            VStack.init(alignment: .leading, spacing: 10, content: {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider.init()
                
                VStack.init(alignment: .leading, spacing: nil, content: {
                    Text.init("Completed Badges")
                        .font(.headline)
                    
                    ScrollView.init(.horizontal, showsIndicators: true, content: {
                        HStack.init(content: {
                            HikeBadge.init(name: "First Hike")
                            HikeBadge.init(name: "Earth Day")
                                .hueRotation(Angle.init(degrees: 90))
                            HikeBadge.init(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle.init(degrees: 45))
                        })
                        .padding()
                    })
                })
                
                Divider.init()
                
                VStack.init(alignment: .leading, spacing: nil, content: {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView.init(hike: self.modelData.hikes[0])
                })
            })
        })
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData.init())
    }
}
