//
//  NetworkManager.swift
//  APITest
//
//  Created by yawmoo_ext on 07/11/22.
//

import Foundation
import Combine
import UIKit // for UIImage

// notice: as explained in the README, I did not write tests for networking code as failure may depend on issues that are not related to the code, such as network being down or similar

class NetworkManager {
    
    static let defaultInstance = NetworkManager()
    
    private func fetch(request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else { throw URLError(.badServerResponse) }
                return data
            }
            .eraseToAnyPublisher()
    }
    
    func fetchDepartments() -> AnyPublisher<[Department], Error> {
        return fetch(request: MetropolitanMuseusOfArt.departments)
            .decode(type: DepartmentsResponseObject.self, decoder: JSONDecoder())
            .map { responseObject -> [Department] in
                return responseObject.departments
            }
            .eraseToAnyPublisher()
    }
    
    func fetchItemIDs(for department: Department) -> AnyPublisher<[Int], Error> {
        return fetch(request: MetropolitanMuseusOfArt.itemIDs(for: department))
            .decode(type: ItemIDResponseObject.self, decoder: JSONDecoder())
            .map { responseObject in
                return responseObject.itemIDs
            }
            .eraseToAnyPublisher()
    }
    
    func fetchItem(for itemID: Int) -> AnyPublisher<Item, Error> {
        return fetch(request: MetropolitanMuseusOfArt.item(for: itemID))
            .decode(type: Item.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchImage(from url: URL) -> AnyPublisher<Data, Error> {
        let request = URLRequest(url: url)
        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else { throw URLError(.badServerResponse) }
                return data
            }
            .eraseToAnyPublisher()
    }

}
