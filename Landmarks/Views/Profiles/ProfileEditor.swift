//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List.init {
            HStack.init(content: {
                Text.init("Username").bold()
                Divider.init()
                TextField.init("Username", text: self.$profile.username)
            })
            
            Toggle.init(isOn: self.$profile.prefersNotifications, label: {
                Text.init("Enable Notifications").bold()
            })
            
            VStack.init(alignment: .leading, spacing: 20, content: {
                Text.init("Seasonal Photo").bold()
                
                Picker.init("Seasonal Photo", selection: self.$profile.seasonalPhoto) {
                    ForEach.init(Profile.Season.allCases) { season in
                        Text.init(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle.init())
            })
            
            DatePicker.init(selection: self.$profile.goalDate, in: self.dateRange) {
                Text.init("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
