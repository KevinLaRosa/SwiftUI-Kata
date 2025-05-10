//
//  GameResult.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//
import SwiftUI

enum GameResult {
    case victory
    case defeat
    case draw
    
    func text() -> String {
        switch self {
        case .victory:
            return "You win!"
        case .defeat:
            return "You lose!"
        case .draw:
            return "It's a draw!"
        }
    }
    
    func smiley() -> String {
        switch self {
        case .victory:
            return "😄"
        case .defeat:
            return "😭"
        case .draw:
            return "😎"
        }
    }
    
    func color() -> Color {
        switch self {
        case .victory:
            return .green
        case .defeat:
            return .red
        case .draw:
            return .yellow
        }
    }
}
