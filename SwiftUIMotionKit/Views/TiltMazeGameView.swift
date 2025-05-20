//
//  TiltMazeGameView.swift
//  SwiftUIMotionKit
//
//  Created by Denidu Gamage on 2025-05-20.
//

import SwiftUI

struct TiltMazeGameView: View {
    let x: Double
    let y: Double

    @State private var ballPosition = CGPoint(x: 150, y: 150)
    private let ballSize: CGFloat = 20
    private let mazeBounds = CGRect(x: 0, y: 0, width: 300, height: 300)

    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color.gray, lineWidth: 2)

            Circle()
                .fill(Color.red)
                .frame(width: ballSize, height: ballSize)
                .position(ballPosition)
        }
        .onChange(of: x) { _ in updateBallPosition() }
        .onChange(of: y) { _ in updateBallPosition() }
    }

    private func updateBallPosition() {
        let deltaX = CGFloat(y) * 10
        let deltaY = CGFloat(-x) * 10

        var newX = ballPosition.x + deltaX
        var newY = ballPosition.y + deltaY

        newX = min(max(mazeBounds.minX + ballSize / 2, newX), mazeBounds.maxX - ballSize / 2)
        newY = min(max(mazeBounds.minY + ballSize / 2, newY), mazeBounds.maxY - ballSize / 2)

        ballPosition = CGPoint(x: newX, y: newY)
    }
}
