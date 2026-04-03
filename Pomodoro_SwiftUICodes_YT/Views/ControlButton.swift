//
//  ControlButton.swift
//  Pomodoro_SwiftUICodes_YT
//
//  Created by app-kaihatsusha on 03/04/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ControlButton: View {
    
    let icon: String
    let colour: Color
    let size: CGFloat
    let action: ()->Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: size * 0.4, weight: .semibold))
                .foregroundStyle(.white)
                .frame(width: size, height: size)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(colors: [colour, colour.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                )
                .shadow(color: colour.opacity(0.5), radius: 10, y: 5)
        }
        .buttonStyle(ScaleButtonStyle())
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.92 : 1)
            .animation(.spring(response: 0.2), value: configuration.isPressed)
    }
    
}

#Preview {
    ControlButton(icon: "triangle", colour: .teal, size: 60) {
        
    }
}
