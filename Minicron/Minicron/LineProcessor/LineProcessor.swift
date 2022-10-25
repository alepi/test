//
//  LineProcessor.swift
//  Minicron
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

class LineProcessor : LineProcessorProtocol {
    
    func process(entry: MinicronEntry, hours: Int, minutes: Int) -> MinicronOutput {
        let totalMinutes = LineProcessor.calcTotalMinutes(hours: hours, minutes: minutes)
        let totalMinutesForEntry = LineProcessor.calcTotalMinutesForEntry(entry: entry, hours: hours, minutes: minutes)
        let isTomorrow = totalMinutesForEntry < totalMinutes
        let executionHour = totalMinutesForEntry / 60
        let executionMinute = totalMinutesForEntry % 60
        return MinicronOutput(entry: entry, isTomorrow: isTomorrow, executionHour: executionHour, executionMinute: executionMinute)
    }
    
    private static func calcTotalMinutes(hours: Int, minutes: Int) -> Int {
        return minutes + 60 * hours
    }
        
    private static func calcTotalMinutesForEntry(entry: MinicronEntry, hours h: Int, minutes m: Int) -> Int {
        if let minutes = entry.minutes, let hours = entry.hours {
            return calcTotalMinutes(hours: hours, minutes: minutes) // will be tomorrow if less than calcTotalMinutes(hours: h, minutes: m)
        } else if let minutes = entry.minutes {
            if minutes >= m {
                return calcTotalMinutes(hours: h, minutes: minutes)
            } else {
                return calcTotalMinutes(hours: h+1, minutes: minutes)
            }
        } else if let hours = entry.hours {
            if hours == h {
                return calcTotalMinutes(hours: hours, minutes: m)
            } else {
                return calcTotalMinutes(hours: hours, minutes: 0) // will be tomorrow if less than calcTotalMinutes(hours: h, minutes: m)
            }
        } else {
            return calcTotalMinutes(hours: h, minutes: m)
        }
    }
    
    
}
