//
//  ExtensionsForTests.swift
//  APITestTests
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation
@testable import APITest

// These methods were implemented in the original classes, but since I moved to using Combine they are not necessary anymore
// They are needed in unit tests though, hence they are added here.

extension DepartmentsResponseObject {
    
    static func from(data: Data) -> DepartmentsResponseObject? {
        return try? JSONDecoder().decode(DepartmentsResponseObject.self, from: data)
    }

}

extension ItemIDResponseObject {
    
    static func from(data: Data) -> ItemIDResponseObject? {
        return try? JSONDecoder().decode(ItemIDResponseObject.self, from: data)
    }
    
}

extension Item {

    static func from(data: Data) -> Item? {
        return try? JSONDecoder().decode(Item.self, from: data)
    }

}
