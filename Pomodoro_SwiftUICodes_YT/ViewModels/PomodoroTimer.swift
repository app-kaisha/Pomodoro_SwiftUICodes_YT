//
//  PomodoroTimer.swift
//  Pomodoro_SwiftUICodes_YT
//
//  Created by app-kaihatsusha on 03/04/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation

@Observable
class PomodoroTimer {
    var timeRemaining: Int
    var isRunning = false
    var currentMode: TimerMode = .focus
    var completedPomodoros = 0
    
    private var timer: Timer?
    
    init() {
        self.timeRemaining = TimerMode.focus.duration
    }
    
    var progress: Double {
        let total = Double(currentMode.duration)
        let remaining = Double(timeRemaining)
        return remaining / total
    }
    
    var timeString: String {
        let minutes  = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
