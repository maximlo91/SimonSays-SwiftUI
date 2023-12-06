//
//  LeaderboardsView.swift
//  SimonSays
//
//  Created by Maxim Lobovich on 02/12/2023.
//

import SwiftUI

struct LeaderboardsView: View {
    @ObservedObject var vm: LeaderboardsViewModel
    
    init(vm: LeaderboardsViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack {
            Text(StringKeys.Leaderboards.title)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            List {
                ForEach(vm.highScores) { highScore in
                    VStack {
                        HighScoreCell(data: highScore)
                        
                        Rectangle()
                            .frame(height: 0.5)
                            .opacity(0.5)
                            .padding(.top, -10)
                    }
                }
                .listRowSeparator(.hidden)

            }
            .listStyle(.plain)
            .padding(.horizontal, 8)
            .overlay {
                if vm.highScores.isEmpty {
                    VStack {
                        Text(StringKeys.Leaderboards.emptyList)
                        Spacer()
                    }
                }
            }
        }
        .padding(.vertical, 1)
    }
}

#Preview {
    LeaderboardsView(vm: LeaderboardsViewModel())
}
