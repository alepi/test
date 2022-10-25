//
//  MinicronEntry.swift
//  Minicron
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

struct MinicronEntry {
    let minutes: Int? // nil represents *
    let hours: Int? // nil represents *
    let command: String
    
    init?(minutes m: Int?, hours h: Int?, command c: String) {
        if(MinicronEntry.checkConstructorParameters(minutes: m, hours: h, command: c)) {
            minutes = m
            hours = h
            command = c
        } else {
            return nil
        }
    }
    
    private static func checkConstructorParameters(minutes: Int?, hours: Int?, command: String) -> Bool {
        if((minutes != nil)&&(minutes! < 0 || minutes! > 59)) { return false }
        if((hours != nil)&&(hours! < 0 || hours! > 23)) { return false }
        // this regex matching could be thought of as redundant, however it's not: LineParser
        // checks for valid commands because it has to, however another caller may be less careful
        guard let regex = try? NSRegularExpression.makeBeginToEnd(pattern: RegExStrings.command) else { return false }
        return regex.matchesFully(string: command)
    }
}
