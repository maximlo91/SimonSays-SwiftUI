//
//  HighScoreRepository.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 01/12/2023.
//

import Foundation

final class HighScoreRepository {
    
    enum HighScoreStorageKey: String {
        case highScoresKey
    }
    
    func getHighScores()-> [HighScore] {
        let userDefaults = UserDefaults.standard
        let data = userDefaults.data(forKey: HighScoreStorageKey.highScoresKey.rawValue) ?? Data()
        let array: [HighScore]? = try? PropertyListDecoder().decode([HighScore].self, from: data)
         
        return array ?? []
    }
    
    func setNew(highScore: HighScore) {
        let userDefaults = UserDefaults.standard
        let data = userDefaults.data(forKey: HighScoreStorageKey.highScoresKey.rawValue) ?? Data()
        var array: [HighScore] = (try? PropertyListDecoder().decode([HighScore].self, from: data)) ?? []
        array.append(highScore)
        
        if let data = try? PropertyListEncoder().encode(array) {
            userDefaults.set(data, forKey: HighScoreStorageKey.highScoresKey.rawValue)
        }
    }
}

