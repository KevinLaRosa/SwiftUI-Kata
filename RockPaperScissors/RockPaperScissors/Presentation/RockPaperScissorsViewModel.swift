//
//  RockPaperScissorsViewModel.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//

import Foundation

class RockPaperScissorsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var playerMoveSelection: GameMove?
    @Published var playerOpponentMoveSelection: GameMove?
    @Published var playerGameResult: GameResult?
    @Published var playerOpponentGameResult: GameResult?
    @Published var playerScore: Int = 0
    @Published var playerOpponentScore: Int = 0
    @Published var gameState: GameState = .selection
    @Published var gameMode: GameMode = .humanVsComputer
    @Published var round: Int = 1

    
    func handleGameMoveTapped(move: GameMove) {
        playerMoveSelection = move
    }
    
    func handleGameModeSelected(mode: GameMode) {
        gameMode = mode
        switch mode {
        case .humanVsHuman:
            print("No supported")
            break
            case .humanVsComputer:
            gameState = .playing
        }
    }
    
    func handleGameStateChanged(state: GameState) {
        gameState = state
    }
    
    func gameMoveSubmitButtonTapped() {
        guard playerMoveSelection != nil else { return }
        switch gameMode {
        case .humanVsComputer:
            opponentComputerMove()
        case .humanVsHuman:
            break
        }
    }
    
    func nextRoundButtonTapped() {
        round += 1
        playerMoveSelection = nil
        playerOpponentMoveSelection = nil
        playerGameResult = nil
        playerOpponentGameResult = nil
        gameState = .playing
    }
    
    
    private func opponentComputerMove() {
        self.playerOpponentMoveSelection = self.generateComputerMove()
        self.determineWinner()
        self.gameState = .result
    }
    
    private func generateComputerMove() -> GameMove {
        let randomValue = Double.random(in: 0...1)
        
        switch randomValue {
        case 0.0..<0.33:
            return .rock
        case 0.33..<0.67:
            return .paper
        default:
            return .scissors
        }
    }
    
    private func determineWinner() {
          guard let playerMoveSelection = playerMoveSelection,
                let playerOpponentMoveSelection = playerOpponentMoveSelection else { return }
          
          if playerMoveSelection == playerOpponentMoveSelection {
              playerGameResult = .draw
              playerOpponentGameResult = .draw
          } else if (playerMoveSelection == .rock && playerOpponentMoveSelection == .scissors) ||
                    (playerMoveSelection == .paper && playerOpponentMoveSelection == .rock) ||
                    (playerMoveSelection == .scissors && playerOpponentMoveSelection == .paper) {
              playerGameResult = .victory
              playerOpponentGameResult = .defeat
              playerScore += 1
          } else {
              playerGameResult = .defeat
              playerOpponentGameResult = .victory
              playerOpponentScore += 1
          }
      }
}
