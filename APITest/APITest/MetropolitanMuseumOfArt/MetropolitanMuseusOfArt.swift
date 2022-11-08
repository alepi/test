//
//  MetropolitanMuseusOfArt.swift
//  APITest
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation

struct MetropolitanMuseusOfArt {
    
    // see https://metmuseum.github.io
    
    private static let baseURLString = "https://collectionapi.metmuseum.org/public/collection/v1"
    
    private static func request(_ path: String) ->URLRequest? {
        guard let url = URL(string: (baseURLString as NSString).appendingPathComponent(path)) else { return nil }
        let result = URLRequest(url: url)
        return result
    }
    
    static let departments = { request("departments") }()!
    
    static func itemIDs(for department: Department) -> URLRequest {
        let path = "objects?departmentIds=\(department.departmentId)"
        return request(path)!
    }
    
    static func item(for itemID: Int) -> URLRequest {
        let path = "objects/\(itemID)"
        return request(path)!
    }

}
