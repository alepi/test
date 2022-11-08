//
//  JSONTests.swift
//  APITestTests
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation

import XCTest
@testable import APITest

final class JSONTests: XCTestCase {

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testDepartments() throws {
        let responseObject = DepartmentsResponseObject.from(data: JSONTestsData.departments)
        XCTAssert(responseObject != nil, "JSON response was not correctly decoded")
        
        let firstDepartment = responseObject?.departments.first
        XCTAssert(firstDepartment != nil, "no departments were decoded")
        
        XCTAssert(firstDepartment!.departmentId == 1, "first department does not have id of 1")
        XCTAssert(firstDepartment!.displayName == "American Decorative Arts", "first department is not American Decorative Arts")
    }

    func testItemIDs() throws {
        let responseObject = ItemIDResponseObject.from(data: JSONTestsData.itemIDs)
        XCTAssert(responseObject != nil, "JSON response was not correctly decoded")
        
        XCTAssert(responseObject!.total == 18465, "wrong number of total items")
        
        let firstDepartment = responseObject!.itemIDs.first
        XCTAssert(firstDepartment != nil, "no items were decoded")
        
        XCTAssert(firstDepartment! == 1, "first item does is not 1")
    }
    
    func testItem() throws {
        let responseObject = Item.from(data: JSONTestsData.item)
        XCTAssert(responseObject != nil, "JSON response was not correctly decoded")
        
        XCTAssert(responseObject!.objectID == 45734, "wrong item id")
                
        XCTAssert(responseObject!.isHighlight == false, "object isHighlight is true")
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
