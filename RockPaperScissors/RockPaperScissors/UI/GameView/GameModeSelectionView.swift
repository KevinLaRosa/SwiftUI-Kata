//
//  GameModeSelectionView.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//
import SwiftUI

struct GameModeSelectionView: View {
    
    @State var gameMode: GameMode
    
    var onGameModeSelected: ((_ mode: GameMode) -> Void)?
    var onGameStateChanged: ((_ state: GameState) -> Void)?
    
    init(_ viewModel: RockPaperScissorsViewModel) {
        self.gameMode = viewModel.gameMode
        self.onGameModeSelected = viewModel.handleGameModeSelected
        self.onGameStateChanged = viewModel.handleGameStateChanged
    }

    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            Text("Choose your game mode")
                .titleLabel()
            
            Picker("Game Mode", selection: $gameMode) {
                ForEach(GameMode.allCases, id: \.self) { mode in
                    Text(mode.title)
                        .tag(mode)
                }
            }
            .pickerStyle(.segmented)
            
            Button("Start") {
                onGameModeSelected?(gameMode)
            }
            .buttonStyle(.borderedProminent)
            .font(.body.bold())
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var viewModel = RockPaperScissorsViewModel()
    
    ZStack {
        BackgroundView()
            .ignoresSafeArea()
        GameModeSelectionView(viewModel)
    }
}
