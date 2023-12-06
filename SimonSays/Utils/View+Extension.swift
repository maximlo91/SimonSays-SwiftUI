//
//  View+Extension.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 19/11/2023.
//

import SwiftUI

extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
