//
//  GameMove.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//

enum GameMove: String, Codable, CaseIterable {
    case rock
    case paper
    case scissors
    
    var icon: String {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "📄"
        case .scissors:
            return "✂️"
        }
    }
    
    var name: String {
        switch self {
        case .rock:
            return "Rock"
        case .paper:
            return "Paper"
        case .scissors:
            return "Scissors"
        }
    }
}
