//
//  c.swift
//  MinicronTests
//
//  Created by YAWMOO Limited on 25/10/2022.
//  Copyright © 2022 Alessandro Pistocchi. All rights reserved.
//

import Foundation

import XCTest

class MinicronTests: XCTestCase {
    
    func testMinicronConstructorWithCorrectParameters() {
        let entry = MinicronEntry(minutes: 0, hours: 0, command: "/bin/test")
        XCTAssert(entry != nil, "Minicron entry is not created with correct values")
    }
    
    func testMinicronConstructorWithIncorrectParameters() {
        let entry = MinicronEntry(minutes: 0, hours: 59, command: "/bin/test")
        XCTAssert(entry == nil, "Minicron entry is created with an hours value of 59")
    }
    
}
    
