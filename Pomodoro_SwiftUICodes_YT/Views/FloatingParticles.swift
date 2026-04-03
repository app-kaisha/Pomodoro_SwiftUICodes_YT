//
//  FloatingParticles.swift
//  Pomodoro_SwiftUICodes_YT
//
//  Created by app-kaihatsusha on 03/04/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct FloatingParticles: View {
    
    let colour: Color
    
    @State private var animate = false
    @State private var particles: [Particle] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(particles) { particle in
                    Circle()
                        .fill(colour.opacity(particle.opacity))
                        .frame(width: particle.size)
                        .position(
                            x: particle.xRatio * geometry.size.width,
                            y: particle.yRatio * geometry.size.height
                        )
                        .offset(y: animate ? -20 : 20)
                        .animation(
                            Animation
                                .easeInOut(duration: particle.duration)
                                .repeatForever(autoreverses: true)
                                .delay(particle.delay),
                            value: animate
                        )
                }
            }
        }
        .animation(.easeInOut(duration: 0.5), value: colour)
        .onAppear {
            if particles.isEmpty {
                particles = (0..<15).map{ index in
                    Particle (
                        xRatio: CGFloat.random(in: 0.05...0.95),
                        yRatio: CGFloat.random(in: 0.05...0.95),
                        size: CGFloat.random(in: 20...60),
                        opacity: Double.random(in: 0.05...0.15),
                        duration: Double.random(in: 3...6),
                        delay: Double(index) * 0.2
                    )
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                animate = true
            }
        }
    }
}

#Preview {
    FloatingParticles(colour: .blue)
}
