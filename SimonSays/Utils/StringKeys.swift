//
//  StringKeys.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 15/11/2023.
//

import Foundation

struct StringKeys {
    struct GameOverPopUp {
        static let gameOver = "Game Over"
        static let score = "Score:"
        static let gameOverPlaceholder = "Enter Name"
        static let submit = "Submit"
        static let skip = "Skip"
    }
    
    struct GameView {
        static let mainTitle = "Simon Says"
        static let myTurn = "My Turn"
        static let yourTurn = "Your Turn"
        static let startGame = "Start Game"
        
        static let leaderboards = "Leaderboards"
        static let settings = "Settings"
    }
    
    struct Leaderboards {
        static let title = "Leaderboards"
        static let emptyList = "No High Scores, Play Some Games."
    }
    
    struct Settings {
        static let title = "Settings"
        static let haptic = "Haptic feedback"
        static let sound = "Sound"
    }
}

