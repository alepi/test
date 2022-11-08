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
        let dataManager = DataManager.defaultInstance
        let item = Item.from(data: JSONTestsData.item)!

        dataManager.departments = [Department(departmentId: 1, displayName: "American Decorative Arts")]
        wait(for: [observer.expectationForDepartments], timeout: 0.1)
        
        dataManager.itemIDs[1] = [item.objectID!]
        wait(for: [observer.expectationForItemIDs], timeout: 0.1)

        dataManager.items = [item.objectID! : item]
        wait(for: [observer.expectationForItems], timeout: 0.1)
    }
    
}

class DataManagerNotificationObserverForTest {
    
    let expectationForDepartments = XCTNSNotificationExpectation(name: .DataManagerDepartmentsDidChange, object: DataManager.defaultInstance, notificationCenter: NotificationCenter.default)
    let expectationForItemIDs = XCTNSNotificationExpectation(name: .DataManagerItemIDsDidChange, object: DataManager.defaultInstance, notificationCenter: NotificationCenter.default)
    let expectationForItems = XCTNSNotificationExpectation(name: .DataManagerItemsDidChange, object: DataManager.defaultInstance, notificationCenter: NotificationCenter.default)

    init() {
        NotificationCenter.default.addObserver(forName: .DataManagerDepartmentsDidChange, object: DataManager.defaultInstance, queue: nil) { [weak self] _ in
            self?.expectationForDepartments.fulfill()
        }
        NotificationCenter.default.addObserver(forName: .DataManagerItemIDsDidChange, object: DataManager.defaultInstance, queue: nil) { [weak self] _ in
            self?.expectationForItemIDs.fulfill()
        }
        NotificationCenter.default.addObserver(forName: .DataManagerItemsDidChange, object: DataManager.defaultInstance, queue: nil) { [weak self] _ in
            self?.expectationForItems.fulfill()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
