//
//  ItemView.swift
//  MathKidsTables
//
//  Created by Roger La Rosa on 18/05/2025.
//


import SwiftUI

struct ItemView: View {
    let title: String
    let tapped: () -> Void
    
    init(_ title: String, tapped: @escaping () -> Void) {
        self.title = title
        self.tapped = tapped
    }
    
    var body: some View {
        Button {
            tapped()
        } label: {
            Text("\(title)")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.regularMaterial)
        .cornerRadius(24)
    }
}
