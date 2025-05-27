//
//  NumberOfQuestion.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//

enum NumberOfQuestion: String, CaseIterable {
    case five
    case ten
    case fifteen
    case twenty
    
    var formatted: String {
        switch self {
        case .five:
            return "5"
        case .ten:
            return "10"
        case .fifteen:
            return "15"
        case .twenty:
            return "20"
        }
    }
    
    var numberOfQuestions: Int {
        switch self {
        case .five:
            return 5
        case .ten:
            return 10
        case .fifteen:
            return 15
        case .twenty:
            return 20
        }
    }
}
