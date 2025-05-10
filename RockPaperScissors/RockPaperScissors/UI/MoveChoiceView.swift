//
//  MoveChoiceView.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 08/05/2025.
//

import SwiftUI

struct MoveChoiceView: View {
    @Binding var selectedMove: GameMove?
    
    let onGameMoveTapped: (_ move: GameMove) -> Void
    let onGameMoveSubmitButtonTapped: () -> Void
    
    init(selectedMove: Binding<GameMove?>, onGameMoveTapped: @escaping (_ move: GameMove) -> Void, onGameMoveSubmitButtonTapped: @escaping () -> Void) {
        self._selectedMove = selectedMove
        self.onGameMoveTapped = onGameMoveTapped
        self.onGameMoveSubmitButtonTapped = onGameMoveSubmitButtonTapped
    }
    
    var body: some View {
        VStack {
            Text("Choose your hand")
                .font(.title.bold())
                .foregroundStyle(.white)
            
            HStack {
                ForEach(GameMove.allCases, id: \.self) { move in
                    Spacer()
                    GameMoveButton(
                        move,
                        isSelected: .constant(selectedMove == move),
                        onTap: onGameMoveTapped
                    )
                    if move != GameMove.allCases.last {
                        Spacer()
                    }
                }
            }
            
            Button(action: {
                onGameMoveSubmitButtonTapped()
            }) {
                Group {
                    if let move = selectedMove {
                        Text("Confirm choice: \(move.icon)")
                    } else {
                        Text("Confirm")
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .opacity(selectedMove != nil ? 1 : 0)
            .font(.body.bold())
            .padding(.top, 20)
        }
    }
}

// Prévisualisation
#Preview {
    ZStack {
        Color.blue.ignoresSafeArea()
        MoveChoiceView(selectedMove: .constant(.rock)) { move in
            print("Selected: \(move)")
        } onGameMoveSubmitButtonTapped: {
            print("Submited")
        }
    }
}
