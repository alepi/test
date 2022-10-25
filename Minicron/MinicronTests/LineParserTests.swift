//
//  LineParserTests.swift
//  MinicronTests
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

import XCTest

class LineParserTests: XCTestCase {
    
    let lineParser = LineParser()
    
    // LineParser tests make sense only when MinicronEntry and NSRegularExpression extensions are absolutely correct.
    // If that was not the case, the implementation of LineParser itself could be correct
    // but the tests may fail due to an error in MinicronEntry or in the NSRegularExpression extensions.

    func testLineParserCorrectLine() {
        let line = TestConstants.correctLine
        XCTAssert(lineParser.parse(line: line) != nil, "The parser generates a nil result when parsing the correct line")
    }
    
    func testLineParserIncorrectLine() {
        let line = TestConstants.incorrectLine
        XCTAssert(lineParser.parse(line: line) == nil, "The parser generates a non nil result when parsing the incorrect line")
    }
    
}
