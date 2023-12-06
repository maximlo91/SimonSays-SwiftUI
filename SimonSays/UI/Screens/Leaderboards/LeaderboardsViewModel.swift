//
//  LeaderboardsViewModel.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 02/12/2023.
//

import Foundation

final class LeaderboardsViewModel: ObservableObject {
    let highScoreRepository = HighScoreRepository()
    let highScores: [HighScore]

    init() {
        let scores = highScoreRepository.getHighScores()
        let sortedScores = scores.sorted { $0.score > $1.score }
        highScores = sortedScores
    }
}
