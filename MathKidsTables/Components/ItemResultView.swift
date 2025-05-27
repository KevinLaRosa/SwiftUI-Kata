//
//  ItemResultView.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 27/05/2025.
//
import SwiftUI

struct colorResult: ViewModifier {
    let isGoodAnswer: Bool
    
    func body(content: Content) -> some View {
        if (isGoodAnswer) {
            content
                .foregroundColor(.green)
        } else {
            content
                .foregroundColor(.red)
        }
    }
}

extension View {
    func colorForAnswer(_ isGoodAnswer: Bool) -> some View {
        modifier(colorResult(isGoodAnswer: isGoodAnswer))
    }
}

struct ItemResultView: View {
    let question: MultiplicationTableRandomQuestion
    
    var body: some View {
        HStack {
            HStack(alignment: .center, spacing: 8) {
                if (question.isGoodAnswer) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.caption)
                        .colorForAnswer(question.isGoodAnswer)
                } else {
                    Image(systemName: "xmark.circle.fill")
                        .font(.caption)
                        .colorForAnswer(question.isGoodAnswer)
                }
                
                Text("\(question.numberMultiplied) x 3")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .colorForAnswer(question.isGoodAnswer)
                Text("=")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .colorForAnswer(question.isGoodAnswer)
                Text("\(question.correctAnswer)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .colorForAnswer(question.isGoodAnswer)
            }
        }
        .padding(32)
        .background(.thickMaterial)
        
    }
}

struct ItemResultView_Previews: PreviewProvider {
    static var previews: some View {
        var question = MultiplicationTableRandomQuestion(.one)
        question.submitAnswer(6)
        return ItemResultView(question: question)
    }
}
