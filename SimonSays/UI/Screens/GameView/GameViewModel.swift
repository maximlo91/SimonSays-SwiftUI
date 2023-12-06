//
//  GameViewModel.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 10/11/2023.
//

import AVKit

final class GameViewModel: ObservableObject {
    
    private let highScoreRepository = HighScoreRepository()

    @Published private(set) var buttonsData: [SimonButtonData] = []
    @Published private(set) var isGameCurrentlyPlaying = false
    @Published private(set) var didPlayerReachTapLimit = false
    @Published private(set) var isSimonTurn = false
    @Published private(set) var gameScore = 0
    @Published var isGameOver = false
    
    private var audioPlayer: AVAudioPlayer?
    private var colorIndexMap: [SimonColor: Int] = [:]
    private var simonColorSequence: [SimonColor] = []
    private var playerColorSequence: [SimonColor] = []
    private var playerTapCount = 0
    
    var playerTapLimit: Int {
        return simonColorSequence.count
    }
    
    var isStartButtonHidden: Bool {
        return isGameCurrentlyPlaying || isGameOver
    }
    
    var isUserInteractionDisabled: Bool {
        return isSimonTurn || didPlayerReachTapLimit || isGameOver
    }
    
    init() {
        setupData()
        setupColorIndexMap()
    }
    
    // MARK: - Setup
    
    private func setupData() {
        let colors = SimonColor.allCases
        var result: [SimonButtonData] = []
        
        for color in colors {
            result.append(SimonButtonData(color: color))
        }
        
        buttonsData = result
    }
    
    private func setupColorIndexMap() {
        for (index, item) in buttonsData.enumerated() {
            colorIndexMap[item.color] = index
        }
    }

    private func endCurrentGame() {
        isGameOver = true
        resetData()
    }
    
    private func resetData() {
        playerTapCount = 0
        isSimonTurn = false
        didPlayerReachTapLimit = false
        isGameCurrentlyPlaying = false
        simonColorSequence.removeAll()
        playerColorSequence.removeAll()
    }
    
    private func playHapticFeedback() {
        guard AppSettings.shared.isHapticFeedbackEnabled else { return }
        
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }
    
    private func playSound(with color: SimonColor) {
        guard AppSettings.shared.isSoundEnabled else { return }
        
        if let soundPath = color.soundPath {
            let url = URL(fileURLWithPath: soundPath)
            
            if audioPlayer != nil {
                audioPlayer?.stop()
            }
            
            audioPlayer = try? AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
    }
    
    // MARK: - Player Turn Functions
    
    func startGame() {
        gameScore = 0
        isGameCurrentlyPlaying = true
        startSimonsTurn()
    }

    func playerInput(with color: SimonColor) {
        playSound(with: color)
        playHapticFeedback()
        
        guard isGameCurrentlyPlaying else { return }
        
        // Limit player input to only the same amount of colors simon guessed
        // so no overflow occures
        playerTapCount += 1
        didPlayerReachTapLimit = playerTapCount == playerTapLimit
        
        // Checking if player tapped the right color
        playerColorSequence.append(color)
        let currentColorIndex = playerColorSequence.count-1
        let isMatchingColors = simonColorSequence[currentColorIndex] == color
        
        guard isMatchingColors else {
            endCurrentGame()
            return
        }
        
        let isPlayerGuessedAllSequence = playerColorSequence.count == simonColorSequence.count
        if isPlayerGuessedAllSequence {
            // Update game score and begin next round
            gameScore = playerColorSequence.count
            playerColorSequence.removeAll()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.startSimonsTurn()
            }
        }
    }
    
    private func executeButtonTap(with color: SimonColor) {
        guard let index = colorIndexMap[color] else {
            fatalError() // Unreachable code
        }
        
        if buttonsData[index].color == color {
            buttonsData[index].isTapped = true
            
            playSound(with: color)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                self.buttonsData[index].isTapped = false
            }
        }
    }

    // MARK: - Simon Turn Functions
    
    private func startSimonsTurn() {
        isSimonTurn = true
        resetPlayerTapCount()
        guessRandomColor()
    }
    
    private func resetPlayerTapCount() {
        playerTapCount = 0
        didPlayerReachTapLimit = false
    }

    private func guessRandomColor() {
        // Simon will guess a random color from the existing colors
        let randomInt = Int.random(in: 0..<buttonsData.count)
        let simonColor = buttonsData[randomInt].color
        simonColorSequence.append(simonColor)
        
        playSequence()
    }

    private func playSequence() {
        let intervalBetweenButtonTapsInSeconds = 1.0
        
        for (index, color) in simonColorSequence.enumerated() {
            let interval = intervalBetweenButtonTapsInSeconds * Double(index)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
                self.executeButtonTap(with: color)
                
                let didReachEndOfSequence = index == self.simonColorSequence.count-1
                if didReachEndOfSequence {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        // Simon finished playing, waiting for player input.
                        self.isSimonTurn = false
                    }
                }
            }
        }
    }
    
    // MARK: - High Score
    
    func save(highScore: HighScore) {
        highScoreRepository.setNew(highScore: highScore)
    }
}
