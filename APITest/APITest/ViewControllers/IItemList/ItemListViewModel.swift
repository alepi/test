//
//  ItemListViewModel.swift
//  APITest
//
//  Created by yawmoo_ext on 09/11/22.
//

import Foundation
import Combine

class ItemListViewModel {
    
    private var itemIDsCancellable: AnyCancellable!
    private var itemsCancellable: AnyCancellable!

    init(_ viewController: ItemListViewController) {
        itemIDsCancellable = DataController.defaultInstance.itemIDsPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak viewController] result in
                guard let viewController = viewController else { return }
                viewController.itemIDs = result[viewController.department.departmentId] ?? []
            })
        itemsCancellable = DataController.defaultInstance.itemsPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak viewController] result in
                guard let viewController = viewController else { return }
                viewController.items = result
            })
    }

}
