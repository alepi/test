//
//  DataController.swift
//  APITest
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation
import Combine

class DataController {
    
    static let defaultInstance = DataController()
    
    let departmentPublisher = NotificationCenter.Publisher(center: .default, name: .DataManagerDepartmentsDidChange, object: DataModel.defaultInstance).map { notification -> [Department] in
        return (notification.object as! DataModel).departments
    }
    
    let itemIDsPublisher = NotificationCenter.Publisher(center: .default, name: .DataManagerItemIDsDidChange, object: DataModel.defaultInstance).map { notification -> [Int:[Int]] in
        return (notification.object as! DataModel).itemIDs
    }
    
    let itemsPublisher = NotificationCenter.Publisher(center: .default, name: .DataManagerItemsDidChange, object: DataModel.defaultInstance).map { notification -> [Int:Item] in
        return (notification.object as! DataModel).items
    }
    
    private var departmentsCancellable : AnyCancellable?
    func updateDepartments() {
        guard departmentsCancellable == nil else { return }
        departmentsCancellable = NetworkManager.defaultInstance.fetchDepartments()
            .sink(receiveCompletion: { [weak self] error in
                NSLog(String(describing: error))
                self?.departmentsCancellable = nil
            }, receiveValue: { [weak self] departments in
                DataModel.defaultInstance.departments = departments
                self?.departmentsCancellable = nil
            })
    }
    
    private var itemIDsCancellable : AnyCancellable?
    func updateItemIDs(for department: Department) {
        guard itemIDsCancellable == nil else { return }
        itemIDsCancellable = NetworkManager.defaultInstance.fetchItemIDs(for: department)
            .sink(receiveCompletion: { [weak self] error in
                NSLog(String(describing: error))
                self?.itemIDsCancellable = nil
            }, receiveValue: { [weak self] itemIDs in
                DataModel.defaultInstance.itemIDs[department.departmentId] = itemIDs
                self?.itemIDsCancellable = nil
            })
    }
    
    private var itemsCancellable : AnyCancellable?
    func updateItem(for itemID: Int) {
        guard itemsCancellable == nil else { return }
        itemsCancellable = NetworkManager.defaultInstance.fetchItem(for: itemID)
            .sink(receiveCompletion: { [weak self] error in
                NSLog(String(describing: error))
                self?.itemsCancellable = nil
            }, receiveValue: { [weak self] item in
                DataModel.defaultInstance.items[itemID] = item
                self?.itemsCancellable = nil
            })
    }

}
