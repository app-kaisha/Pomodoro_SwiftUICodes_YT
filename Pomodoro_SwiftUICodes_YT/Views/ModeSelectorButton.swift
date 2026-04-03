//
//  ModeSelectorButton.swift
//  Pomodoro_SwiftUICodes_YT
//
//  Created by app-kaihatsusha on 03/04/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct ModeSelectorButton: View {
    
    let mode: TimerMode
    let isSelected: Bool
    let action: ()->Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: mode.icon)
                    .font(.system(size: 18))
                Text(mode.rawValue)
                    .font(.system(size: 11, weight: .medium))
            }
            .foregroundStyle(isSelected ? .white : .white.opacity(0.5))
            .frame(width: 60, height: 90)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(isSelected ? mode.colour.opacity(0.3) : .white.opacity(0.05))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(isSelected ? mode.colour : .clear)
                    }
            )
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.3), value: isSelected)
        }
    }
}

#Preview {
    ModeSelectorButton(mode: .focus, isSelected: true) {
        
    }
}
