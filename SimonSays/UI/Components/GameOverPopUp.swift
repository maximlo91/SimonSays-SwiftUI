//
//  GameOverPopUp.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 13/11/2023.
//

import SwiftUI

struct GameOverPopUp: View {
    @Binding var isGameOver: Bool
    @State var text: String = ""
    
    var score: Int
    var save: ((HighScore)-> Void)?
    
    init(isGameOver: Binding<Bool>, score: Int, save: ((HighScore) -> Void)? = nil) {
        self._isGameOver = isGameOver
        self.score = score
        self.save = save
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            headerView
            Spacer()
                .frame(height: 40)
            
            textfieldView
            Spacer()
            
            buttonsView
        }
        .frame(maxWidth: .infinity)
        .frame(height: UIScreen.main.bounds.height*0.4)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
        .padding(.horizontal, 32)
        .shadow(radius: 6)
        .transition(.asymmetric(insertion: .push(from: .bottom), removal: .push(from: .top)))
    }
    
    @ViewBuilder
    var headerView: some View {
        Text(StringKeys.GameOverPopUp.gameOver)
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding([.top, .horizontal])
        
        Text("\(StringKeys.GameOverPopUp.score) \(score)")
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding(.top, 4)
    }
    
    @ViewBuilder
    var textfieldView: some View {
        ZStack(alignment: .leading) {
            
            Text(StringKeys.GameOverPopUp.gameOverPlaceholder)
                .font(Font.system(size: text.isEmpty ? 18 : 14))
                .offset(y: text.isEmpty ? -2 : -30)
                .opacity(text.isEmpty ? 1 : 0.5)
                .animation(.smooth, value: text)
                .padding(.bottom, 4)
                .padding(.horizontal)
            
            VStack {
                TextField(String(), text: $text)
                    .background(.clear)
                    .padding(.vertical, 4)
                    .submitLabel(.done)
                
                Rectangle()
                    .fill(.black)
                    .frame(height: 1)
            }
            .padding(.horizontal)
            
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    var buttonsView: some View {
        VStack {
            GeometryReader { geo in
                FilledButton(text: StringKeys.GameOverPopUp.submit, action: submitTapped)
                    .frame(width: geo.size.width*0.8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .frame(height: 60)
            
            Spacer()
                .frame(height: 16)
            
            Button(StringKeys.GameOverPopUp.skip, action: skipTapped)
                .padding(.top, -8)
                .padding(.bottom, 24)
        }
    }
    
    private func submitTapped() {
       dismiss(willSave: true)
    }
    
    private func skipTapped() {
        dismiss(willSave: false)
    }
    
    private func dismiss(willSave: Bool) {
        endTextEditing()
        
        if willSave {
            let highScore = HighScore(playerName: text, score: score)
            self.save?(highScore)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            isGameOver = false
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GameOverPopUp(isGameOver: .constant(true), score: 0)
}
