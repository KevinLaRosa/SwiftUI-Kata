//
//  GameResultView.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 10/05/2025.
//

import SwiftUI
struct GameResultView: View {
    
    @Binding var playerMoveSelection: GameMove?
    @Binding var playerOpponentMoveSelection: GameMove?
    @Binding var playerGameResult: GameResult?
    @Binding var playerOpponentGameResult: GameResult?
    @Binding var round: Int
    
    var nextRoundButtonTapped: () -> Void = { }
    
    
    var playerScoreColor : Color {
        guard let playerGameResult else { return .red }
        return playerGameResult.color()
    }
    
    var playerOpponentScoreColor : Color {
        guard let playerOpponentGameResult else { return .red }
        return playerOpponentGameResult.color()
    }
    
    
    var RoundInfoView: some View {
        HStack(alignment: .center, spacing: 64) {
            VStack(spacing: 8) {
                Text("Player 1")
                    .foregroundStyle(playerScoreColor)
                    .font(.title3.bold())
                Text(playerMoveSelection?.icon ?? "")
                    .foregroundStyle(playerScoreColor)
                    .font(.system(size: 64, weight: .bold))
                
            }
            Text("VS")
                .font(.largeTitle.bold())
                .foregroundStyle(.gray)
            
            VStack(spacing: 8) {
                Text("Player 2")
                    .foregroundStyle(playerOpponentScoreColor)
                    .font(.title3.bold())
                Text(playerOpponentMoveSelection?.icon ?? "")
                    .foregroundStyle(playerScoreColor)
                    .font(.system(size: 64, weight: .bold))
            }
        }
    }
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Result of the round \(round)")
                .titleLabel()
                .multilineTextAlignment(.center)
            Text(playerGameResult?.text() ?? "")
                .font(.largeTitle.bold())
                .foregroundStyle(playerScoreColor)
            
            Text(playerGameResult?.smiley() ?? "")
                .font(.system(size: 128))
                .foregroundStyle(.white)
            
            RoundInfoView
            
            ActionButton("Restart") {
                nextRoundButtonTapped()
            }
            
        }
    }
    
    init (_ viewModel: RockPaperScissorsViewModel) {
        
        _playerGameResult = Binding(
            get: { viewModel.playerGameResult },
            set: { viewModel.playerGameResult = $0 }
        )
        _playerOpponentGameResult = Binding(
            get: { viewModel.playerOpponentGameResult },
            set: { viewModel.playerOpponentGameResult = $0 }
        )
        
        _playerMoveSelection = Binding(
            get: { viewModel.playerMoveSelection },
            set: { viewModel.playerMoveSelection = $0 }
        )
        _playerOpponentMoveSelection = Binding(
            get: { viewModel.playerOpponentMoveSelection },
            set: { viewModel.playerOpponentMoveSelection = $0 }
        )
        
        _round = Binding(
            get: { viewModel.round },
            set: { viewModel.round = $0 }
        )
        
        nextRoundButtonTapped = viewModel.nextRoundButtonTapped
    }
}


struct GameResultView_Previews: PreviewProvider {
    static var previews: some View {
        // Créer un ViewModel mocké pour la prévisualisation
        let viewModel = RockPaperScissorsViewModel()
        viewModel.playerGameResult = .victory
        viewModel.playerOpponentGameResult = .defeat
        viewModel.playerMoveSelection = .rock
        viewModel.playerOpponentMoveSelection = .scissors
        
        
        return ZStack {
            BackgroundView()
                .ignoresSafeArea()
            GameResultView(viewModel)
        }
    }
}
