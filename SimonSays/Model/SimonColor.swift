//
//  SimonColor.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 15/11/2023.
//

import Foundation
import struct SwiftUI.Color

enum SimonColor: Int, CaseIterable {
    case red
    case blue
    case yellow
    case green
    
    var toSwiftUIColor: Color {
        switch self {
        case .red:
            return Color.red
        case .blue:
            return Color.blue
        case .yellow:
            return Color.yellow
        case .green:
            return Color.green
        }
    }

    var soundPath: String? {
        var soundName = ""
        
        switch self {
        case .red:
            soundName = "do"
        case .blue:
            soundName = "re"
        case .yellow:
            soundName = "mi"
        case .green:
            soundName = "fa"
        }
        
        return Bundle.main.path(forResource: soundName, ofType: "wav")
    }
}
