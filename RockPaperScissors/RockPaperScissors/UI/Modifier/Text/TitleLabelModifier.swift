//
//  TitleLabelModifier.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 10/05/2025.
//

import SwiftUI

struct TitleLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .foregroundStyle(.white)
    }
}

extension Text {
    func titleLabel() -> some View {
        modifier(TitleLabelModifier())
    }
}
