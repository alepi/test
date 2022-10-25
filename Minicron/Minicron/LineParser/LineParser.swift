//
//  LineParser.swift
//  Minicron
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

class LineParser : LineParserProtocol {
    
    func parse(line: String) -> MinicronEntry? {
        // this is necessary to ensure that values are in the correct order
        guard NSRegularExpression.configLine.matchesFully(string: line) else { return nil }
        var regex = NSRegularExpression.numberOrStar
        let numbers = regex.matchedValues(string: line)
        if numbers.count != 2 { return nil }
        regex = NSRegularExpression.command
        let commands = regex.matchedValues(string: line)
        if commands.count != 1 { return nil }

        let minutes = LineParser.numberValue(string: numbers[0])
        let hours = LineParser.numberValue(string: numbers[1])
        
        if minutes != nil && minutes! < 0 { return nil }
        if hours != nil && hours! < 0 { return nil }

        return MinicronEntry(minutes: minutes, hours: hours, command: commands[0])
    }

    private static func numberValue(string: String) -> Int? {
        if string == "*" {
            return nil
        } else if let m = Int(string) {
            return m
        } else { return -1 } // I have to distinguish between nil and invalid. -1 means invalid
    }
}
