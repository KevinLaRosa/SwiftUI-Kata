//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = RockPaperScissorsViewModel()
    
    @ViewBuilder
    var GameView: some View {
        switch viewModel.gameState {
        case .selection:
            GameModeSelectionView(viewModel)
        case .playing:
            GamePlayView(viewModel)
        case .result:
            GameResultView(viewModel)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    Text("🪨, 📄, ✂️ Game")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    Spacer()
                    GameView
                        .padding(32)
                    Spacer()
          
                }
            }
        }
      
    }
}

#Preview {
    ContentView()
}
