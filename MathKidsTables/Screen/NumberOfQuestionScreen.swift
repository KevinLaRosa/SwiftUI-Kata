//
//  NumberOfQuestionScreen.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//

import SwiftUI

struct NumberOfQuestionScreen: View {
    @EnvironmentObject private var router: NavigationRouter
    @EnvironmentObject private var gameManager: GameManager

    var body: some View {
        VStack(spacing: 40) {
            Text("Choose number of questions")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            Spacer()
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(NumberOfQuestion.allCases, id: \.self) { nbOfQuestion in
                    Button {
                        gameManager.numberOfQuestions = nbOfQuestion
                        router.navigate(to: .quiz
                        )
                    } label: {
                        VStack(alignment: .center, spacing: 16) {
                
                            Image(systemName: "\(nbOfQuestion.formatted).circle")
                                .font(.title)
                                .foregroundColor(.white)

                            Text("questions")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                     
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .buttonStyle(.plain)
                    .frame(width:730, height: 200)
                    .background(.regularMaterial)
                    .cornerRadius(24)
                }
            }
            .padding(.horizontal)

            Spacer()

            BackButton {
                router.goBack()
            } label: {
                Label("Back to Home", systemImage: "house.fill")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Number of Questions")
    }
}

// Aperçu pour Xcode
#Preview {
    NavigationStack {
        NumberOfQuestionScreen()
            .environmentObject(NavigationRouter())
    }
}

