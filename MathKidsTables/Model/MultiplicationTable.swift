//
//  multiplicationTable.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//

enum MultiplicationTable: String, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten

    var formatted: String {
        switch self {
        case .one:
            return "1x"
        case .two:
            return "2x"
        case .three:
            return "3x"
        case .four:
            return "4x"
        case .five:
            return "5x"
        case .six:
            return "6x"
        case .seven:
            return "7x"
        case .eight:
            return "8x"
        case .nine:
            return "9x"
        case .ten:
            return "10x"
        }
    }

    var numberText: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .ten:
            return "10"
        }
    }

    func result(of number: Int) -> Int {
        switch self {
        case .one:
            return number
        case .two:
            return number * 2
        case .three:
            return number * 3
        case .four:
            return number * 4
        case .five:
            return number * 5
        case .six:
            return number * 6
        case .seven:
            return number * 7
        case .eight:
            return number * 8
        case .nine:
            return number * 9
        case .ten:
            return number * 10
        }
    }
}
