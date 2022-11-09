//
//  DepartmentsViewModel.swift
//  APITest
//
//  Created by yawmoo_ext on 08/11/22.
//

import Foundation
import Combine

class DepartmentsViewModel {
    
    private var departmentsCancellable: AnyCancellable!
    
    init(_ viewController: DepartmentsViewController) {
        departmentsCancellable = DataController.defaultInstance.departmentPublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak viewController] result in
                viewController?.departments = result
            })
    }

}
