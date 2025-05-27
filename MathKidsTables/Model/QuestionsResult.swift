//
//  QuestionResult.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 27/05/2025.
//
import SwiftUI

enum QuestionsResult {
    case good(nbCorrect: Int, nbQuestions: Int)
    case bad(nbcorrect: Int, nbQuestions: Int)
    
    init (nbcorrect: Int, nbQuestions: Int) {
        if nbcorrect >= nbQuestions / 2 {
            self = .good(nbCorrect: nbcorrect, nbQuestions: nbQuestions)
        } else {
            self = .bad(nbcorrect: nbcorrect, nbQuestions: nbQuestions)
        }
    }
    
    var color: Color {
        switch self {
        case .good:
            return .green
        case .bad:
            return .red
        }
    }
    
    var emoji: String {
        switch self {
        case .good:
            return "😁"
        case .bad:
            return "😭"
        }
    }
    
    var text: String {
        switch self {
        case .good:
            return "Congratulations !"
        case .bad:
            return "Try again !"
        }
    }
    
    var nbCorrect: Int {
        switch self {
        case .good(nbCorrect: let nb, nbQuestions: _):
            return nb
        case .bad(nbcorrect: let nb, nbQuestions: _):
            return nb
        }
    }
    
    var nbQuestions: Int {
        switch self {
        case .good(nbCorrect: _, nbQuestions: let nb):
            return nb
        case .bad(nbcorrect: _, nbQuestions: let nb):
            return nb
        }
    }
    
    
}
