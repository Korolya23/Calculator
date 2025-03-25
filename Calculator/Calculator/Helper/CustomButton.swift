//
//  CustomButton.swift
//  Calculator
//
//  Created by Artem on 24.03.25.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let action: () -> Void
    var color: Color = .blue
    var width: CGFloat = 80
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.1)) {
                action()
            }
        }) {
            Text(text)
                .font(.system(size: 25, weight: .bold))
                .frame(width: width, height: 80)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
                .scaleEffect(1)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
