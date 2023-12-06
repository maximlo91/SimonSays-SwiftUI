//
//  HighScore.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 01/12/2023.
//

import Foundation

struct HighScore: Codable, Identifiable {
    var id: String
    var playerName: String
    var score: Int
    var timestamp: String
    
    init(playerName: String, score: Int) {
        self.id = UUID().uuidString
        self.playerName = playerName
        self.score = score
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm dd/MM/yy"
        let currentDate = Date()
        self.timestamp = dateFormatter.string(from: currentDate)
    }
}
