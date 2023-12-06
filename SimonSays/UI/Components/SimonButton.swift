//
//  SimonButton.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 10/11/2023.
//

import SwiftUI

struct SimonButton: View {
    private let color: SimonColor
    private let action: ((SimonColor)->Void)?
    
    init(color: SimonColor, action: ((SimonColor)->Void)?) {
        self.color = color
        self.action = action
    }
    
    var body: some View {
        
        Button(action: { action?(color) }, label: {
            Rectangle()
                .fill(color.toSwiftUIColor)
                .cornerRadius(30)
        })
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SimonButton(color: .blue, action: {_ in })
        .frame(width: 200, height: 200)
}
