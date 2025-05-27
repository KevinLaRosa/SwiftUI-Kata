//
//  HomeScreen.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//

import SwiftUI

struct HomeScreen: View {

    @EnvironmentObject private var router: NavigationRouter
    @EnvironmentObject private var gameManager: GameManager

    private var columns: [GridItem] = Array(
        repeating: .init(.flexible()),
        count: 3
    )

    var body: some View {
        VStack(spacing: 64) {
            Text("Choice your table")
                .font(.title)
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(MultiplicationTable.allCases, id: \.self) { item in
                    ItemView(item.formatted) {
                        gameManager.multiplicationTable = item
                        router.navigate(to: .NumberOfQuestion)
                    }
                    .frame(width: 500, height: 140)
                }
            }
            Spacer()
        }
        .navigationTitle("Multiplication Tables")
        .padding()

    }
}
