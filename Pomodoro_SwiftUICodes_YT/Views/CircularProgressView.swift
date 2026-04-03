//
//  CircularProgressView.swift
//  Pomodoro_SwiftUICodes_YT
//
//  Created by app-kaihatsusha on 03/04/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct CircularProgressView: View {
    
    let progress: Double
    let mode: TimerMode
    let timeString: String
    
    @State private var animatedProgress: Double = 1.0
    
    var body: some View {
        ZStack {
            // Background circle
            Circle()
                .stroke(mode.colour.opacity(0.2), lineWidth: 20)
            
            // Progress Circle
            Circle()
                .trim(from: 0, to: animatedProgress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: mode.gradientColours),
                        center: .center,
                        startAngle: .degrees(-90),
                        endAngle: .degrees(270)
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.3), value: animatedProgress)
            
            // Inner glow effect
            Circle()
                .fill(
                    RadialGradient(colors: [mode.colour.opacity(0.1), .clear],
                                   center: .center,
                                   startRadius: 50,
                                   endRadius: 140)
                )
                .padding(30)
            
            // Centre Content
            VStack(spacing: 8) {
                Image(systemName: mode.icon)
                    .font(.system(size: 32))
                    .foregroundStyle(mode.colour)
                
                Text(timeString)
                    .font(.system(size: 64, weight: .thin, design: .rounded))
                    .foregroundStyle(.white)
                    .monospacedDigit()
                
                Text(mode.rawValue.uppercased())
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(mode.colour)
                    .tracking(3)
            }
            
        }
        .frame(width: 300, height: 300)
        .onChange(of: progress) { oldValue, newValue in
            animatedProgress = newValue
        }
    }
}

#Preview("CircularProgressView Preview") {
    CircularProgressView(progress: 0.5, mode: .focus, timeString: "14:03")
}
