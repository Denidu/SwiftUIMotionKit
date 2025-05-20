//
//  ParallaxCardView.swift
//  SwiftUIMotionKit
//
//  Created by Denidu Gamage on 2025-05-20.
//

import SwiftUI

struct ParallaxCardView: View {
    let x: Double
    let y: Double

    var body: some View {
        let tiltAmount: CGFloat = 20

        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
                .shadow(radius: 10)

            Text("Parallax Card")
                .foregroundColor(.white)
                .font(.headline)
        }
        .rotation3DEffect(
            .degrees(x * tiltAmount),
            axis: (x: 1, y: 0, z: 0))
        .rotation3DEffect(
            .degrees(y * tiltAmount),
            axis: (x: 0, y: 1, z: 0))
        .animation(.easeOut(duration: 0.2), value: x)
        .animation(.easeOut(duration: 0.2), value: y)
    }
}
