//
//  QuizResultScreen.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//
import SwiftUI

struct QuizResultScreen: View {
    @EnvironmentObject private var router: NavigationRouter
    @EnvironmentObject private var gameManager: GameManager
    @State var isPresented: Bool = false

    var body: some View {
        if let result = gameManager.result {
            ScrollView {
                VStack(spacing: 24) {
                    Spacer(minLength: 20)

                    VStack(alignment: .center, spacing: 16) {
                        Text("Your Score")
                            .font(.title)
                            .fontWeight(.semibold)

                        Text("\(result.nbCorrect)/\(result.nbQuestions)")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundStyle(result.color)
                            .multilineTextAlignment(.center)

                        Text(result.emoji)
                            .font(.system(size: 100))

                        Text(result.text)
                            .font(.title2)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    VStack(spacing: 8) {
                        Button {
                            isPresented.toggle()
                        } label: {
                            HStack {
                                Image(
                                    systemName:
                                        "checkmark.circle.badge.questionmark"
                                )
                                Text("Check questions")
                            }
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)

                            .foregroundColor(.white)
                            .cornerRadius(12)
                        }
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.primary)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }

                    Spacer(minLength: 20)

                    BackButton {
                        router.goToRoot()
                        gameManager.resetGame()
                    } label: {
                        HStack {
                            Image(systemName: "house.fill")
                            Text("Back to Home")
                        }
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)

                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                }
            }
            .sheet(isPresented: $isPresented) {
                QuizResultDetailScreen(isPresented: $isPresented)
            }
            .navigationTitle(
                "Resultat table mutiplication \(gameManager.multiplicationTable.formatted)"
            )
        }
    }
}

struct QuizResultScreen_Previews: PreviewProvider {
    static var previews: some View {
        let gameManager = GameManager()
        gameManager.startGame()
        gameManager.setAnswerForCurrentQuestion(2)
        gameManager.setAnswerForCurrentQuestion(2)
        gameManager.setAnswerForCurrentQuestion(2)
        gameManager.setAnswerForCurrentQuestion(2)
        gameManager.setAnswerForCurrentQuestion(2)

        gameManager.result = .init(nbcorrect: 10, nbQuestions: 10)

        return QuizResultScreen()
            .environmentObject(gameManager)
            .environmentObject(NavigationRouter())
    }
}
