//
//  MotionService.swift
//  SwiftUIMotionKit
//
//  Created by Denidu Gamage on 2025-05-20.
//

import CoreMotion
import Combine

class MotionService {
    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()
    
    let motionPublisher = PassthroughSubject<MotionData, Never>()

    func startUpdates() {
        guard motionManager.isAccelerometerAvailable else { return }

        motionManager.accelerometerUpdateInterval = 1.0 / 60.0
        motionManager.startAccelerometerUpdates(to: queue) { [weak self] data, error in
            guard let data = data else { return }
            let motionData = MotionData(x: data.acceleration.x, y: data.acceleration.y, z: data.acceleration.z)
            DispatchQueue.main.async {
                self?.motionPublisher.send(motionData)
            }
        }
    }

    func stopUpdates() {
        motionManager.stopAccelerometerUpdates()
    }
}

