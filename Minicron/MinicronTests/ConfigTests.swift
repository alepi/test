//
//  RegExTests.swift
//  RegExTests
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import XCTest

class RegExTests: XCTestCase {
    
//    override func setUp() {
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testConfigString() {
        let a = TestConstants.configString.split(separator: "\n")
        var expectedCount = 4
        XCTAssertEqual(a.count, expectedCount, "The config string shows \(a.count) entries instead of \(expectedCount)")
        for s in a {
            let line = String(s) // s is a Substring, it has to be converted to String
            let range = NSRange(line.startIndex..<line.endIndex, in: line)
            let matches = NSRegularExpression.configLine.matches(in: line, options: .anchored, range: range)
            let countOfNonEmptyMatches = matches.map { ($0.range.length>0) ? 1 : 0 }.reduce(0) { $0 + $1 }
            expectedCount = 1
            XCTAssert(countOfNonEmptyMatches == 1, "There are \(countOfNonEmptyMatches) non empty matches instead of \(expectedCount)")
            let firstMatchRange = Range(matches.first!.range, in: line)!
            let matchedString = String(line[firstMatchRange])
            XCTAssert(matchedString == line)
        }
    }
    
    // tests what happens when one of the lines ends with \r\n instead of just \n
    func testconfigStringWithSpuriousSlashR() {
        let a = Array(TestConstants.configStringWithSpuriousSlashR.split(separator: "\n"))
        var expectedCount = 3
        XCTAssertEqual(a.count, expectedCount, "The config string shows \(a.count) entries instead of \(expectedCount)")
        for s in a {
            let line = String(s) // s is a Substring, it has to be converted to String
            let range = NSRange(line.startIndex..<line.endIndex, in: line)
            let matches = NSRegularExpression.configLine.matches(in: line, options: .anchored, range: range)
            guard let r = matches.first?.range, let firstMatchRange = Range(r, in: line) else { XCTAssertFalse(false, "The string with a spurious \r is recognised and this may be an issue") ; return }
            let countOfNonEmptyMatches = matches.map { ($0.range.length>0) ? 1 : 0 }.reduce(0) { $0 + $1 }
            expectedCount = 1
            XCTAssert(countOfNonEmptyMatches == 1, "There are \(countOfNonEmptyMatches) non empty matches instead of \(expectedCount)")
            let matchedString = String(line[firstMatchRange])
            XCTAssert(matchedString == line)
        }
    }

// not caring about performance at this level of granularity now
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
