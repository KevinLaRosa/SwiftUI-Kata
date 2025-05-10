//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//

import SwiftUI

struct GamePlayView: View {
    @Binding var playerScore: Int
    @Binding var playerOpponentScore: Int
    @Binding var gameMove: GameMove?
    
    let handleGameMoveTapped: (_ move: GameMove) -> Void
    let gameMoveSubmitButtonTapped: () -> Void
    
    init(_ viewModel: RockPaperScissorsViewModel) {
        _playerScore = Binding(
            get: { viewModel.playerScore },
            set: { viewModel.playerScore = $0 }
        )
        _playerOpponentScore = Binding(
            get: { viewModel.playerOpponentScore },
            set: { viewModel.playerOpponentScore = $0 }
        )
        
        _gameMove = Binding(
            get: { viewModel.playerMoveSelection },
            set: { viewModel.playerMoveSelection = $0 }
        )
        
        self.handleGameMoveTapped = viewModel.handleGameMoveTapped
        self.gameMoveSubmitButtonTapped = viewModel.gameMoveSubmitButtonTapped
    }
    
    var body: some View {
        Group {
            HStack {
                Spacer()
                ScoreView(playerName: "Player 1", score: $playerScore)
                Spacer()
                ScoreView(playerName: "Player 2", score: $playerOpponentScore)
                Spacer()
            }
            Spacer()
            MoveChoiceView(selectedMove: $gameMove, onGameMoveTapped: handleGameMoveTapped, onGameMoveSubmitButtonTapped: gameMoveSubmitButtonTapped)
            Spacer()
            Spacer()
        }
    }
}

