//
//  PomodoroView.swift
//  Pomodoro_SwiftUICodes_YT
//
//  Created by app-kaihatsusha on 03/04/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct PomodoroView: View {
    var body: some View {
        VStack {
            CircularProgressView(progress: 0.75, mode: .focus, timeString: "13:43")
        }
    }
}

#Preview {
    PomodoroView()
}
