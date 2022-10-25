//
//  LineProcessorTests.swift
//  MinicronTests
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//


import Foundation

import XCTest

class LineProcessorTests: XCTestCase {
    
    let lineParser = LineParser()
    lazy var lineParsedArray = { TestConstants.configArray.map { lineParser.parse(line: $0) } }()
    let lineProcessor = LineProcessor()
    
    func testConfigArray() {
        for i in 0..<lineParsedArray.count {
            let entry = lineParsedArray[i]!
            let outputString = TestConstants.outputArray[i]
            let processedOutputString = lineProcessor.process(entry: entry, hours: 16, minutes: 10).toFormattedString()
            XCTAssert(processedOutputString == outputString, "processedOutputString is different from outputString:\nprocessedOutputString: \(processedOutputString)\noutputString: \(outputString)")
        }
    }

}
