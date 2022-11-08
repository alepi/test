//
//  DataFetchManager.swift
//  APITest
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation

extension NSNotification.Name {

    public static let DataManagerDepartmentsDidChange = NSNotification.Name("DataManagerDepartmentsDidChange")
    public static let DataManagerItemIDsDidChange = NSNotification.Name("DataManagerItemIDsDidChange")
    public static let DataManagerItemsDidChange = NSNotification.Name("DataManagerItemsDidChange")

}
class DataManager {
    
    static let defaultInstance = DataManager()

    var departments: [Department] = [] {
        didSet {
            NotificationCenter.default.post(name: .DataManagerDepartmentsDidChange, object: self)
        }
    }
    
    var itemIDs: [Int:[Int]] = [:] {
        didSet {
            NotificationCenter.default.post(name: .DataManagerItemIDsDidChange, object: self)
        }
    }
    
    var items: [Int:Item] = [:] {
        didSet {
            NotificationCenter.default.post(name: .DataManagerItemsDidChange, object: self)
        }
    }
    
}
