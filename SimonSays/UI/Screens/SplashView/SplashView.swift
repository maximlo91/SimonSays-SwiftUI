//
//  SplashView.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 03/12/2023.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject var coordinator: AppCoordinator
    @State var didNavigate: Bool = false
    
    var body: some View {
        VStack {
            Image(.splash)
                .resizable()
                .scaledToFit()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                coordinator.push(screen: .gameView)
                self.didNavigate = true
            }
        }
        .opacity(didNavigate ? 0.0 : 1.0)
        
    }
}

#Preview {
    SplashView()
}
