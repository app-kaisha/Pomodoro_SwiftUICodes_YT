//
//  PomodoroCounter.swift
//  Pomodoro_SwiftUICodes_YT
//
//  Created by app-kaihatsusha on 03/04/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct PomodoroCounter: View {
    
    let count: Int
    let colour: Color
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<4) { index in
                Circle()
                    .fill(
                        index < (count % 4) || (count > 0 && count % 4 == 0) ? colour : colour.opacity(0.2)
                    )
                    .frame(width: 12, height: 12)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Capsule().fill(.ultraThinMaterial))
    }
}

#Preview {
    PomodoroCounter(count: 2, colour: .teal)
}
