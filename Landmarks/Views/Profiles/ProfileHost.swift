//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 御前崎悠羽 on 2021/7/11.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile: Profile = Profile.default
    
    var body: some View {
        VStack.init(alignment: .leading, spacing: 20, content: {
            HStack.init(content: {
                if self.editMode?.wrappedValue == .active {
                    Button.init("Cancel") {
                        self.draftProfile = self.modelData.profile
                        self.editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer.init()
                EditButton.init()
            })
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary.init(profile: self.modelData.profile)
            } else {
                ProfileEditor.init(profile: self.$draftProfile)
                    .onAppear(perform: {
                        self.draftProfile = self.modelData.profile
                    })
                    .onDisappear(perform: {
                        self.modelData.profile = self.draftProfile
                    })
            }
        })
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData.init())
    }
}
