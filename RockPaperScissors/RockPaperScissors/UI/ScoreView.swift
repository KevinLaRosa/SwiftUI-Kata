//
//  ScoreView.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//

import SwiftUI

struct ScoreView: View {
    
    let playerName: String
    @Binding var score: Int
    
    var body: some View {
        VStack(alignment: .center) {
            Text(playerName)
                .font(.title.weight(.semibold))
                .foregroundStyle(.white)
            Text("Score: \(score)")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.white)
        
        }
    }
}
