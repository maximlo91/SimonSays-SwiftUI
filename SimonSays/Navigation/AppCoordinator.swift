//
//  AppCoordinator.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 03/12/2023.
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    
    enum AppPath {
        case splash
        case gameView
        case leaderboards
        case settings
    }

    @Published var path = NavigationPath()
    
    @ViewBuilder
    func rootView()-> some View {
        build(.splash)
    }
    
    @ViewBuilder
    func build(_ screen: AppPath)-> some View {
        switch screen {
        case .splash:
            SplashView()
        case .gameView:
            let viewModel = GameViewModel()
            GameView(vm: viewModel)
        case .leaderboards:
            let viewModel = LeaderboardsViewModel()
            LeaderboardsView(vm: viewModel)
        case .settings:
            SettingsView()
        }
    }
    
    func push(screen: AppPath) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
