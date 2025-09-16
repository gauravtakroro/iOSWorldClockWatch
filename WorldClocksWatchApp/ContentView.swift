//
//  ContentView 2.swift
//  WorldClocksWatch Watch App
//
//  Created by Gaurav Tak on 16/09/25.
//

import SwiftUICore
import SwiftUI


// MARK: - ContentView
struct ContentView: View {
    @StateObject private var model = ClockModel(updateInterval: 1)
    
    private let clocks: [CityClock] = [
        CityClock(name: "New Delhi", timezone: TimeZone(identifier: "Asia/Kolkata")!, flag: "🇮🇳"),
        CityClock(name: "London", timezone: TimeZone(identifier: "Europe/London")!, flag: "🇬🇧"),
        CityClock(name: "New York", timezone: TimeZone(identifier: "America/New_York")!, flag: "🇺🇸"),
        CityClock(name: "Tokyo", timezone: TimeZone(identifier: "Asia/Tokyo")!, flag: "🇯🇵"),
        CityClock(name: "Dubai", timezone: TimeZone(identifier: "Asia/Dubai")!, flag: "🇦🇪"),
        CityClock(name: "Sydney", timezone: TimeZone(identifier: "Australia/Sydney")!, flag: "🇦🇺")
    ]
    
    private let gridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 12) {
                ForEach(clocks) { clock in
                    AnalogClockView(clock: clock, date: model.now)
                }
            }
            .padding(.horizontal, 4)
        }
    }
}
