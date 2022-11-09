//
//  DataManagerTests.swift
//  APITestTests
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation

import XCTest
@testable import APITest

final class DataManagerTests: XCTestCase {
    
    func testNotifications() {
        
        let observer = DataManagerNotificationObserverForTest()
        let dataModel = DataModel.defaultInstance
        let item = Item.from(data: JSONTestsData.item)!

        dataModel.departments = [Department(departmentId: 1, displayName: "American Decorative Arts")]
        wait(for: [observer.expectationForDepartments], timeout: 0.1)
        
        dataModel.itemIDs[1] = [item.objectID!]
        wait(for: [observer.expectationForItemIDs], timeout: 0.1)

        dataModel.items = [item.objectID! : item]
        wait(for: [observer.expectationForItems], timeout: 0.1)
    }
    
}

class DataManagerNotificationObserverForTest {
    
    let expectationForDepartments = XCTNSNotificationExpectation(name: .DataManagerDepartmentsDidChange, object: DataModel.defaultInstance, notificationCenter: NotificationCenter.default)
    let expectationForItemIDs = XCTNSNotificationExpectation(name: .DataManagerItemIDsDidChange, object: DataModel.defaultInstance, notificationCenter: NotificationCenter.default)
    let expectationForItems = XCTNSNotificationExpectation(name: .DataManagerItemsDidChange, object: DataModel.defaultInstance, notificationCenter: NotificationCenter.default)

    init() {
        NotificationCenter.default.addObserver(forName: .DataManagerDepartmentsDidChange, object: DataModel.defaultInstance, queue: nil) { [weak self] _ in
            self?.expectationForDepartments.fulfill()
        }
        NotificationCenter.default.addObserver(forName: .DataManagerItemIDsDidChange, object: DataModel.defaultInstance, queue: nil) { [weak self] _ in
            self?.expectationForItemIDs.fulfill()
        }
        NotificationCenter.default.addObserver(forName: .DataManagerItemsDidChange, object: DataModel.defaultInstance, queue: nil) { [weak self] _ in
            self?.expectationForItems.fulfill()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
