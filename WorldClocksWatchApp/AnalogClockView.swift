//
//  AnalogClockView.swift
//  WorldClocksWatch Watch App
//
//  Created by Gaurav Tak on 16/09/25.
//

import SwiftUICore
import SwiftUI


// MARK: - AnalogClockView
struct AnalogClockView: View {
    let clock: CityClock
    let date: Date
    
    
    private var calendar: Calendar {
        var cal = Calendar.current
        cal.timeZone = clock.timezone
        return cal
    }
    
    
    private var hour: Int { calendar.component(.hour, from: date) % 12 }
    private var minute: Int { calendar.component(.minute, from: date) }
    private var second: Int { calendar.component(.second, from: date) }
    
    
    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 2)
                    .foregroundColor(.white)
                    .frame(width: 70, height: 70)
                
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 2, height: 18)
                    .offset(y: -9)
                    .rotationEffect(.degrees(Double(hour) / 12.0 * 360.0 + Double(minute) / 60.0 * 30.0))
                
                
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 1.5, height: 26)
                    .offset(y: -13)
                    .rotationEffect(.degrees(Double(minute) / 60.0 * 360.0))
                
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 1, height: 30)
                    .offset(y: -15)
                    .rotationEffect(.degrees(Double(second) / 60.0 * 360.0))
                
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 4, height: 4)
            }
            .frame(width: 70, height: 70)
            
            
            Text(clock.flag)
                .font(.caption)
            Text(clock.name)
                .font(.caption2)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
    }
}

struct AnalogClockView_Previews: PreviewProvider {
    static var previews: some View {
        AnalogClockView(clock: CityClock(name: "London", timezone: TimeZone(identifier: "Europe/London")!, flag: "🇬🇧"), date: Date())
            .previewLayout(.sizeThatFits)
    }
}
