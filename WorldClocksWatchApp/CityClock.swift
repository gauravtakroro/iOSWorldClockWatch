//
//  CityClock.swift
//  WorldClocksWatch Watch App
//
//  Created by Gaurav Tak on 16/09/25.
//

import Foundation


// MARK: - CityClock Model
struct CityClock: Identifiable {
    let id = UUID()
    let name: String
    let timezone: TimeZone
    let flag: String
}
