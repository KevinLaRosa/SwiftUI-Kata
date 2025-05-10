//
//  GameMode.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//


enum GameMode: String, CaseIterable {
    case humanVsComputer
    case humanVsHuman
    
    var title: String {
        switch self {
        case .humanVsComputer:
            return "Human vs Computer"
        case .humanVsHuman:
            return "Human vs Human"
        }
    }
}
