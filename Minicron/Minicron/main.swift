//
//  main.swift
//  Minicron
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

func processCommandLineArguments() -> (Int,Int) {
    let commandLineArguments = CommandLine.arguments
    if commandLineArguments.count != 2 {
        print("usage: \(commandLineArguments[0]) <HH::MM>")
        exit(-1)
    }
    var regex = NSRegularExpression.HHMM
    guard regex.matchesFully(string: commandLineArguments[1]) else {
        print("HH:MM parameter must be a valid hour of the day, between 00:00 and 23:59")
        exit(-1)
    }
    regex = NSRegularExpression.number2Digits
    let a = regex.matchedValues(string: commandLineArguments[1])
    // the test with >=0 is technically redundant, as the string already matches just two digits, there is no sign
    guard let hours = Int(a[0]), let minutes = Int(a[1]), hours >= 0 && hours < 24, minutes >= 0 && minutes < 60 else {
        print("HH:MM parameter must be a valid hour of the day, between 00:00 and 23:59")
        exit(-1)
    }
    return (hours, minutes)
}

let lineParser: LineParserProtocol = LineParser()
let lineProcessor: LineProcessorProtocol = LineProcessor()

let (hours, minutes) = processCommandLineArguments()

var lineCounter = 1

// I do it line by line here because otherwise if run without a pipe one would see the results only after pressing control-d for EOF

while let line = readLine(strippingNewline: true) {
    if let entry = lineParser.parse(line: line) {
        let output = lineProcessor.process(entry: entry, hours: hours, minutes: minutes)
        print(output.toFormattedString())
    } else {
        fputs("Error parsing line \(lineCounter): \(line)", stderr)
        exit(-1)
    }
    lineCounter += 1
}

exit(0)
