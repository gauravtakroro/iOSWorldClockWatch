//
//  ClockModel.swift
//  WorldClocksWatch Watch App
//
//  Created by Gaurav Tak on 16/09/25.
//


import Foundation
import Combine

final class ClockModel: ObservableObject {
    @Published var now: Date = Date()
    private var cancellable: AnyCancellable?
    
    init(updateInterval seconds: TimeInterval = 1.0) {
        cancellable = Timer
            .publish(every: seconds, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] date in
                self?.now = date
            }
    }
    
    deinit {
        cancellable?.cancel()
    }
}
