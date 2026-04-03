//
//  PomodoroView.swift
//  Pomodoro_SwiftUICodes_YT
//
//  Created by app-kaihatsusha on 03/04/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct PomodoroView: View {
    
    @State private var pomodoroTimer = PomodoroTimer()
    @State private var showingStats = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.05, blue: 0.15),
                    Color(red: 0.1, green: 0.1, blue: 0.2),
                    pomodoroTimer.currentMode.colour.opacity(0.15)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            FloatingParticles(colour: pomodoroTimer.currentMode.colour)
            
            VStack(spacing: 40) {
                // Header
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Pomodoro")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                        Text("Stay focused, be productive")
                            .font(.system(size: 14))
                            .foregroundStyle(.white.opacity(0.6))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(pomodoroTimer.completedPomodoros)")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(pomodoroTimer.currentMode.colour)
                        Text("sessions")
                            .foregroundStyle(.white.opacity(0.5))
                    }
                }
                .padding(.horizontal, 30)
                
                
                Spacer()
                
                CircularProgressView(
                    progress: pomodoroTimer.progress,
                    mode: pomodoroTimer.currentMode,
                    timeString: pomodoroTimer.timeString
                )
                
                PomodoroCounter(
                    count: pomodoroTimer.completedPomodoros,
                    colour: pomodoroTimer.currentMode.colour
                )
                
                Spacer()
                
                HStack(spacing: 12) {
                    ForEach(TimerMode.allCases, id: \.self) { mode in
                        ModeSelectorButton(
                            mode: mode,
                            isSelected: pomodoroTimer.currentMode == mode) {
                                withAnimation(.spring(response: 0.4)) {
                                    pomodoroTimer.switchMode(mode)
                                }
                            }
                    }
                }
                
                // Control Buttons
                
            }
        }.foregroundStyle(.white)
    }
}

#Preview {
    PomodoroView()
}
