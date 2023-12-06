//
//  FilledButton.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 16/11/2023.
//

import SwiftUI

struct FilledButton: View {
    let text: String
    let textColor: Color = .white
    let fillColor: Color = .blue
    let action: (()->Void)?

    var body: some View {
        Button {
            action?()
        } label: {
            VStack {
                Text(text)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(fillColor)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
      
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FilledButton(text: "Start", action: nil)
}
