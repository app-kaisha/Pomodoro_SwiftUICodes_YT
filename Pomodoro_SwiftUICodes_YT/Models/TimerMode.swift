//
//  TimerMode.swift
//  Pomodoro_SwiftUICodes_YT
//
//  Created by app-kaihatsusha on 03/04/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

enum TimerMode: String, CaseIterable {
    case focus = "Focus"
    case shortBreak = "Short Break"
    case longBreak = "Long Break"
    
    var duration: Int {
        switch self {
        case .focus:
            return 25 * 60
        case .shortBreak:
            return 5 * 60
        case .longBreak:
            return 15 * 60
        }
    }
    
    var colour: Color {
        switch self {
        case .focus:
            return .orange
        case .shortBreak:
            return . mint
        case .longBreak:
            return .indigo
        }
    }
    
    var gradientColours: [Color] {
        switch self {
        case .focus:
            return [.orange, .red]
        case .shortBreak:
            return [.mint, .teal]
        case .longBreak:
            return [.indigo, .purple]
        }
    }
    
    var icon: String {
        switch self {
        case .focus:
            return "brain.head.profile"
        case .shortBreak:
            return "cup.and.saucer.fill"
        case .longBreak:
            return "moon.stars.fill"
        }
    }
}
