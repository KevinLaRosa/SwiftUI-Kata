//
//  QuizResultDetailScreen.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 27/05/2025.
//
import SwiftUI

struct QuizResultDetailScreen: View {

    @EnvironmentObject var router: NavigationRouter
    @EnvironmentObject var gameManager: GameManager
    @Binding var isPresented: Bool

    var columns: [GridItem] = Array(
        repeating: .init(.flexible(minimum: 400, maximum: 400)),
        count: 3
    )

    var body: some View {
        VStack {
            Spacer()
            Text("Your question answers :")
                .font(.title3)
                .fontWeight(.semibold)

            Spacer()

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(gameManager.questions, id: \.self) { q in
                    ItemResultView(question: q)

                }
            }
            .padding(.horizontal)
            Spacer()
            BackButton {
                isPresented.toggle()
            } label: {
                HStack {
                    Image(systemName: "arrowshape.backward.circle")
                    Text("Back")
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
}
