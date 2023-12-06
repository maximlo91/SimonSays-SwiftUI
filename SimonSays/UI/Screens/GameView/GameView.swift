//
//  ContentView.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 04/11/2023.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @ObservedObject private var vm: GameViewModel
    @State var isPopUpDisplayed = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(vm: GameViewModel = GameViewModel()) {
        self.vm = vm
    }
    
    var body: some View {
        VStack {
            headerView
            navigationButtonsView
            
            Spacer()
                .frame(height: 16)
            
            gameGrid
            startButton
        }
        .padding(.horizontal)
        .padding(.bottom)
        .disabled(vm.isUserInteractionDisabled)
        .transaction { $0.animation = .none }
        .overlay {
            if isPopUpDisplayed {
                GameOverPopUp(isGameOver: $vm.isGameOver, score: vm.gameScore, save: vm.save(highScore:))
            }
        }
        .onChange(of: vm.isGameOver, {
            withAnimation {
                isPopUpDisplayed = vm.isGameOver
            }
        })
        .navigationTitle(String())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(false)
        
    }
    
    @ViewBuilder var headerView: some View {
        Text(StringKeys.GameView.mainTitle)
            .font(.largeTitle)
            .fontWeight(.bold)
        
        Text(vm.isSimonTurn ? StringKeys.GameView.myTurn : StringKeys.GameView.yourTurn)
            .font(.title)
            .foregroundColor(vm.isSimonTurn ? .red : .blue)
            .fontWeight(.bold)
        
        Text(String(vm.gameScore))
            .font(Font.system(size: 42))
            .fontWeight(.bold)
            .padding(.bottom, 2)
    }
    
    
    @ViewBuilder var navigationButtonsView: some View {
        HStack {
            Button(action: {
                appCoordinator.push(screen: .leaderboards)
            }, label: {
                VStack(alignment: .center) {
                    Image(.leaderboardIcon)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(vm.isGameCurrentlyPlaying ? .gray : .black)
                        .frame(width: 32, height: 32)
                       
                    Text(StringKeys.GameView.leaderboards)
                        .foregroundColor(vm.isGameCurrentlyPlaying ? .gray : .blue)
                }
            })
            
            Spacer()

            Button(action: {
                appCoordinator.push(screen: .settings)
            }, label: {
                VStack(alignment: .center) {
                    Image(.settingsIcon)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(vm.isGameCurrentlyPlaying ? .gray : .black)
                        .frame(width: 32, height: 32)
                    
                    Text(StringKeys.GameView.settings)
                        .foregroundColor(vm.isGameCurrentlyPlaying ? .gray : .blue)
                }
            })
        }
    }
    
    @ViewBuilder var gameGrid: some View {
        GeometryReader { geo in
            LazyVGrid(columns: columns ) {
                ForEach(vm.buttonsData) { button in
                    SimonButton(color: button.color, action: vm.playerInput(with:))
                        .frame(height: geo.size.width/2)
                        .aspectRatio(1.0, contentMode: .fit)
                        .opacity(button.isTapped ? 0.5 : 1.0)
                        .animation(.interactiveSpring(duration: 0.15), value: button.isTapped)
                }
            }
        }
    }
    
    @ViewBuilder var startButton: some View {
        if !vm.isStartButtonHidden {
            FilledButton(text: StringKeys.GameView.startGame, action: vm.startGame)
                .frame(width: UIScreen.main.bounds.width*0.6)
        }
    }
}

#Preview {
    GameView()
}
