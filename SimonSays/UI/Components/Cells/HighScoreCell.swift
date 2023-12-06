//
//  HighScoreCell.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 02/12/2023.
//

import SwiftUI

struct HighScoreCell: View {
    let data: HighScore
    
    var body: some View {
        HStack {
            VStack(alignment: .leading)  {
                Text(data.playerName)
                    .font(.title)
                    .fontWeight(.medium)
                
                Text("\(data.timestamp)")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .opacity(0.7)
            }
            
            Spacer()
            
            Text("\(data.score)")
                .font(.title)
                .fontWeight(.semibold)
            
        }
    }
}
