//
//  GameManager.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//
import Combine
import SwiftUI

class GameManager: ObservableObject {
    private var router: NavigationRouter?

    @Published var multiplicationTable: MultiplicationTable = .five
    @Published var numberOfQuestions: NumberOfQuestion = .five
    @Published var questions: [MultiplicationTableRandomQuestion] = []
    @Published var currentIndexQuestion = 0
    @Published var isStarted: Bool = false
    @Published var result: QuestionsResult?

    var nbOfQuestions: Int { questions.count }

    var currentQuestion: MultiplicationTableRandomQuestion? {
        questions[currentIndexQuestion]
    }
    
    var nbOfCorrectAnswers: Int {
        questions.reduce(0) { result, question in
            result + (question.isAnswered && question.isGoodAnswer ? 1 : 0)
        }
    }

    var isAllQuestionsAnswered: Binding<Bool> {
        .init(
            get: { self.questions.first { $0.isAnswered } == nil },
            set: { _ in }
        )
    }

    func setRouter(_ router: NavigationRouter) {
        self.router = router
    }

    func startGame() {
        questions = Array(0..<numberOfQuestions.numberOfQuestions).map { _ in
            MultiplicationTableRandomQuestion(multiplicationTable)
        }
        isStarted = true
    }
    
    func resetGame() {
        currentIndexQuestion = 0
        result = nil
        isStarted = false
    }

    func setAnswerForCurrentQuestion(_ answer: Int) {
        guard var currentQuestion = currentQuestion else { return }

        currentQuestion.submitAnswer(answer)

        questions[currentIndexQuestion] = currentQuestion

        if currentIndexQuestion < nbOfQuestions - 1 {
            currentIndexQuestion += 1
        } else {
            result = .init(nbcorrect: nbOfCorrectAnswers, nbQuestions: nbOfQuestions)
            router?.navigate(
                to: .result
            )
        }
    }
}
