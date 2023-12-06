//
//  SimonButtonData.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 10/11/2023.
//

import Foundation

struct SimonButtonData: Identifiable {

    var id: Int {
        return self.color.rawValue
    }

    let color: SimonColor
    var isTapped: Bool = false
}
