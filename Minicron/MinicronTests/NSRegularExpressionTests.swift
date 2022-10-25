//
//  RegExFunctionsTest.swift
//  MinicronTests
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

import XCTest

class NSRegularExpressionTests: XCTestCase {
    
    let regex = NSRegularExpression.numberOrStar

    func testMatchedValues() {
        let string = TestConstants.correctLine;
        let a = regex.matchedValues(string: string)
        let expectedResult = 2
        XCTAssert(a.count == expectedResult, "NSRegularExpression.matchesFully returns \(a.count) numbers instead of \(expectedResult)")
    }
    
}
