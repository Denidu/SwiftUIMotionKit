//
//  DashboardView.swift
//  SwiftUIMotionKit
//
//  Created by Denidu Gamage on 2025-05-20.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var viewModel: MotionViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("SwiftUI MotionKit")
                .font(.largeTitle)
                .bold()

            Text("X: \(MotionUtils.format(viewModel.motionData.x))")
            Text("Y: \(MotionUtils.format(viewModel.motionData.y))")
            Text("Z: \(MotionUtils.format(viewModel.motionData.z))")

            ParallaxCardView(x: viewModel.motionData.x, y: viewModel.motionData.y)
                .frame(width: 250, height: 150)

            TiltMazeGameView(x: viewModel.motionData.x, y: viewModel.motionData.y)
                .frame(width: 300, height: 300)
        }
        .padding()
    }
}
