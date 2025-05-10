//
//  GameMoveButton.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//

import SwiftUI

struct GameMoveButton: View {
    var gameMove: GameMove
    var onTap: (_ move: GameMove) -> Void
    
    @Binding private var isSelected: Bool

    init(_ gameMove: GameMove, isSelected: Binding<Bool>, onTap: @escaping (_ move: GameMove) -> Void) {
        self.gameMove = gameMove
        self.onTap = onTap
        _isSelected = isSelected
    }

    var body: some View {
        Button(
            action: {
                onTap(gameMove)
            },
            label: {
                VStack {
                    Text(gameMove.icon)
                        .font(.system(size: 32))
                        .padding(32)
                        .background(Color.white)
                        .cornerRadius(20)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 0.18, green: 0.8, blue: 0.44), lineWidth: isSelected ? 4 : 0)
                        }
                        .shadow(radius: 5)
                    Text(gameMove.name)
                        .font(.headline)
                        .foregroundStyle(Color.white)
                }
            }
        )
        .buttonStyle(.plain)
    }
}
