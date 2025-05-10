//
//  BackgroundView.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//

import SwiftUI

struct BackgroundView: View {
    var body: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 0.12, green: 0.16, blue: 0.25), // Dark blue
                Color(red: 0.20, green: 0.25, blue: 0.35), // Medium blue
                Color(red: 0.15, green: 0.20, blue: 0.30)  // Accent blue
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
