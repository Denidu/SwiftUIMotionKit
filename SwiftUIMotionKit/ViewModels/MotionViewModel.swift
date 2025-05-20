//
//  MotionViewModel.swift
//  SwiftUIMotionKit
//
//  Created by Denidu Gamage on 2025-05-20.
//

import Foundation
import Combine

class MotionViewModel: ObservableObject {
    @Published var motionData: MotionData = MotionData(x: 0, y: 0, z: 0)
    
    private let service = MotionService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        service.motionPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.motionData, on: self)
            .store(in: &cancellables)
        
        service.startUpdates()
    }
    
    deinit {
        service.stopUpdates()
    }
}
