//
//  QuizScreen.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//
import SwiftUI

struct ItemStyleForQuizModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct QuizScreen: View {

    @EnvironmentObject private var router: NavigationRouter
    @EnvironmentObject private var gameManager: GameManager

    var currentQuestion: MultiplicationTableRandomQuestion? {
        guard !gameManager.isStarted else { return nil }
        return self.currentQuestion
    }

    func launchQuiz() {
        gameManager.startGame()
    }

    func itemTapped(_ answer: Int) {
        print("Tapped \(answer)")
        gameManager.setAnswerForCurrentQuestion(answer)
    }

    var body: some View {
        VStack(spacing: 64) {
            if gameManager.isStarted {
                if let currentQuestion = gameManager.currentQuestion {
                    Text(currentQuestion.questionText)
                        .font(.title)
                    Spacer()
                    VStack {
                        HStack {
                            ItemView("\(currentQuestion.possibleAnswers[0])") {
                                itemTapped(currentQuestion.possibleAnswers[0])
                            }
                            .modifier(ItemStyleForQuizModifier())

                            ItemView("\(currentQuestion.possibleAnswers[1])") {
                                itemTapped(currentQuestion.possibleAnswers[1])

                            }
                            .modifier(ItemStyleForQuizModifier())
                        }

                        HStack {
                            ItemView("\(currentQuestion.possibleAnswers[2])") {
                                itemTapped(currentQuestion.possibleAnswers[2])

                            }
                            .modifier(ItemStyleForQuizModifier())

                            ItemView("\(currentQuestion.possibleAnswers[3])") {
                                itemTapped(currentQuestion.possibleAnswers[3])

                            }
                            .modifier(ItemStyleForQuizModifier())
                        }
                    }
                    Spacer()

                    BackButton {
                        router.goToRoot()
                        gameManager.resetGame()
                    } label: {
                        Label("Back to Home", systemImage: "house.fill")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                    }
                }
            } else {
                Text("loading...")
            }
        }
        .navigationTitle(
            "Quiz table multiplication \(gameManager.multiplicationTable.formatted)"
        )
        .onAppear {
            launchQuiz()
        }

    }

}

// Aperçu pour Xcode
#Preview {
    QuizScreen()
        .environmentObject(GameManager())
        .environmentObject(NavigationRouter())
}
