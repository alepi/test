//
//  NetworkManager.swift
//  APITest
//
//  Created by yawmoo_ext on 07/11/22.
//

import Foundation

// notice: as explained in the README, I did not write tests for networking code as failure may depend on issues that are not related to the code, such as network being down or similar

class NetworkManager {
    
    static let defaultInstance = NetworkManager()
    
    private let urlSession : URLSession
    
    init() {
        let urlSessionConfiguration = URLSessionConfiguration.default
        urlSession = URLSession(configuration: urlSessionConfiguration)
    }
    
    private func fetch(request: URLRequest, completionBlock: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let dataTask = urlSession.dataTask(with: request, completionHandler: completionBlock)
        dataTask.resume()
    }
    
    func fetchDepartments(dataManager: DataManager) {
        fetch(request: MetropolitanMuseusOfArt.departments) { data, response, error in
            guard error == nil else { NSLog(error!.localizedDescription) ; return }
            guard let data = data else { NSLog("response data is nil") ; return }
            guard let responseObject = DepartmentsResponseObject.from(data: data) else { NSLog("response data is not valid") ; return }
            dataManager.departments = responseObject.departments
        }
    }
    
    func fetchItemIDs(dataManager: DataManager, for department: Department) {
        fetch(request: MetropolitanMuseusOfArt.itemIDs(for: department)) { data, response, error in
            guard error == nil else { NSLog(error!.localizedDescription) ; return }
            guard let data = data else { NSLog("response data is nil") ; return }
            guard let responseObject = ItemIDResponseObject.from(data: data) else { NSLog("response data is not valid") ; return }
            dataManager.itemIDs[department.departmentId] = responseObject.itemIDs
        }
    }
    
    func fetchItem(dataManager: DataManager, for itemID: Int) {
        fetch(request: MetropolitanMuseusOfArt.item(for: itemID)) { data, response, error in
            guard error == nil else { NSLog(error!.localizedDescription) ; return }
            guard let data = data else { NSLog("response data is nil") ; return }
            guard let responseObject = Item.from(data: data) else { NSLog("response data is not valid") ; return }
            dataManager.items[itemID] = responseObject
        }
    }

}
