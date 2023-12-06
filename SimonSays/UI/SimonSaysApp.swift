//
//  SimonSaysApp.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 04/11/2023.
//

import SwiftUI

@main
struct SimonSaysApp: App {

    @StateObject var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.rootView()
                    .navigationDestination(for: AppCoordinator.AppPath.self) { screen in
                        appCoordinator.build(screen)
                    }
            }
            .environmentObject(appCoordinator)
        }
    }
}
