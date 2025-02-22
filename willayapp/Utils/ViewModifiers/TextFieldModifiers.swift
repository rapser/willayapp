//
//  TextFieldModifiers.swift
//  twitter-clone
//
//  Created by miguel tomairo on 19/02/25.
//

import SwiftUI

struct TextFieldModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
