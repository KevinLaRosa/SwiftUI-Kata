//
//  MathKidsTablesApp.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//

import SwiftUI

@main
struct MathKidsTablesApp: App {
    
    @StateObject private var router = NavigationRouter()
    @StateObject private var gameManager = GameManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                HomeScreen()
                    .navigationDestination(for: AppScreen.self) { screen in
                        switch screen {
                        case .home:
                            EmptyView()
                        case .NumberOfQuestion:
                            NumberOfQuestionScreen()
                        case .quiz:
                            QuizScreen()
                        case .result:
                            QuizResultScreen()
                        }
                    }
            }
            .environmentObject(gameManager)
            .environmentObject(router)
            .onAppear {
                gameManager.setRouter(router)
            }
        }
    }
}
