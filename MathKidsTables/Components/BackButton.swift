//
//  BackButton.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 19/05/2025.
//

import SwiftUI

struct BackButton<Label: View>: View {
    let tapped: () -> Void
    @ViewBuilder let label: Label
    
    public var body: some View {
        Button {
            tapped()
        } label: {
            label
        }
        .background(Color.gray.opacity(0.2))
        .foregroundColor(.primary)
        .cornerRadius(10)
    }
}
