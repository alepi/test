//
//  Item.swift
//  APITest
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation

// notice: I call "item" what in the API is called "object", but I keep the name objectIDs for conformity with the json response

struct ItemIDResponseObject : Decodable {
    let total: Int
    private let objectIDs: [Int]
    
    var itemIDs: [Int] { return objectIDs }
    
    static func from(data: Data) -> ItemIDResponseObject? {
        return try? JSONDecoder().decode(ItemIDResponseObject.self, from: data)
    }
}
