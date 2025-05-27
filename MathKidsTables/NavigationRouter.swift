//
//  NavigationRouter.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//

import SwiftUI
import Combine

class NavigationRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    // Ajouter un écran à la pile de navigation
    func navigate(to screen: AppScreen) {
        path.append(screen)
    }
    
    // Revenir en arrière d'un écran
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    // Revenir en arrière de plusieurs écrans
    func goBack(steps: Int) {
        if path.count >= steps && steps > 0 {
            path.removeLast(steps)
        }
    }
    
    // Retourner à la racine (écran d'accueil)
    func goToRoot() {
        path = NavigationPath()
    }
}
