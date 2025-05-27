//
//  MultiplicationTableRandomQuestion.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//

struct MultiplicationTableRandomQuestion: Identifiable, Hashable {
    var id: String
    
    var multiplicationTable: MultiplicationTable
    var numberMultiplied: Int
    var userAnswer: Int?
    var possibleAnswers: [Int] = []

    var isAnswered: Bool {
        return userAnswer != nil
    }

    var correctAnswer: Int {
        return multiplicationTable.result(of: numberMultiplied)
    }

    var questionText: String {
        return "\(multiplicationTable.numberText) × \(numberMultiplied) = ?"
    }
    
    var isGoodAnswer: Bool {
        return userAnswer == correctAnswer
    }

    init(_ multiplicationTable: MultiplicationTable) {
        let numberMultiplied = Int.random(in: 0...10)
        self.multiplicationTable = multiplicationTable
        self.id = "\(multiplicationTable.numberText) x \(numberMultiplied)"
        self.numberMultiplied = numberMultiplied
        possibleAnswers = generateAnswerOptions()
    }
    
    
    private func generateAnswerOptions() -> [Int] {
        var options = [
            correctAnswer,
            correctAnswer + Int.random(in: 1...13),
            max(correctAnswer - Int.random(in: 1...13), 0),
            correctAnswer + Int.random(in: 1...13) * 2
        ]
        
        options.shuffle()
        
        return options
    }
    
    mutating func submitAnswer(_ answer: Int) {
           self.userAnswer = answer
       }
}
