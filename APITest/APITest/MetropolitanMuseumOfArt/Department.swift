//
//  Department.swift
//  APITest
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation

struct Department : Decodable {
    let departmentId: Int
    let displayName: String
}

struct DepartmentsResponseObject: Decodable {
    let departments: [Department]
    
    static func from(data: Data) -> DepartmentsResponseObject? {
        return try? JSONDecoder().decode(DepartmentsResponseObject.self, from: data)
    }
}
