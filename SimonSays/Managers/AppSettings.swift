//
//  AppSettings.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 05/12/2023.
//

import Foundation

final class AppSettings {
    enum AppSettingsKeys: String {
        case haptic
        case sound
    }
    
    static let shared = AppSettings()
    private init() {}
    
    var isHapticFeedbackEnabled: Bool {
        return UserDefaults.standard.value(forKey: AppSettingsKeys.haptic.rawValue) as? Bool ?? true
    }
    
    var isSoundEnabled: Bool {
        return UserDefaults.standard.value(forKey: AppSettingsKeys.sound.rawValue) as? Bool ?? true
    }
    
    func setHaptic(enabled: Bool) {
        UserDefaults.standard.setValue(enabled, forKey: AppSettingsKeys.haptic.rawValue)
    }
    
    func setSound(enabled: Bool) {
        UserDefaults.standard.setValue(enabled, forKey: AppSettingsKeys.sound.rawValue)
    }
}
