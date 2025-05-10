//
//  Button.swift
//  RockPaperScissors
//
//  Created by Roger La Rosa on 10/05/2025.
//
import SwiftUI

struct ActionButton: View {
    
    var title: String
    var action: (() -> Void)?
    
    init(_ title: String, action: (() -> Void)? = nil) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(title) {
            action?()
        }
        .buttonStyle(.borderedProminent)
        .font(.body.bold())
    }
    
}
