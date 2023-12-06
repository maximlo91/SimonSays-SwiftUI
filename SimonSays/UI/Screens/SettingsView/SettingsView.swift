//
//  SettingsView.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 04/12/2023.
//

import SwiftUI

struct SettingsView: View {
    @State var haptic = AppSettings.shared.isHapticFeedbackEnabled
    @State var sound = AppSettings.shared.isSoundEnabled
    
    var body: some View {
        VStack {
            Text(StringKeys.Settings.title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            List {
                Toggle(StringKeys.Settings.haptic, isOn: $haptic)
                    .onChange(of: haptic) { oldValue, newValue in
                        AppSettings.shared.setHaptic(enabled: newValue)
                    }
                
                Toggle(StringKeys.Settings.sound, isOn: $sound)
                    .onChange(of: sound) { oldValue, newValue in
                        AppSettings.shared.setSound(enabled: newValue)
                    }
            }
        }
        .padding(.vertical, 1)
    }
}

#Preview {
    SettingsView()
}
