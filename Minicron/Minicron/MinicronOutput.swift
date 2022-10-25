
//
//  MinicronOutput.swift
//  Minicron
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

struct MinicronOutput {
    let entry: MinicronEntry
    let isTomorrow: Bool
    let executionHour: Int
    let executionMinute: Int
    
    func toFormattedString() -> String {
        let day = isTomorrow ? "tomorrow" : "today"
        return "\(executionHour):\(String(format: "%02d", executionMinute)) \(day) - \(entry.command)"
    }
}
