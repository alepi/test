//
//  ViewController.swift
//  APITest
//
//  Created by yawmoo_ext on 07/11/22.
//

import UIKit

class DepartmentsViewController: UIViewController {

    var viewModel: DepartmentsViewModel!
    var departments: [Department] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DepartmentsViewModel(self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if departments.count == 0 {
            DataController.defaultInstance.updateDepartments()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if animated, let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.scrollToRow(at: indexPathForSelectedRow, at: .middle, animated: true)
            tableView.deselectRow(at: indexPathForSelectedRow, animated: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == .showItemListSegueIdentifier {
            
            let destination = segue.destination as! ItemListViewController
            destination.department = departments[tableView.indexPathForSelectedRow!.row]
            
        }
    }
    
}

extension DepartmentsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: .showItemListSegueIdentifier, sender: nil)
    }
}

extension DepartmentsViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = tableView.dequeueReusableCell(withIdentifier: .departmentTableViewCellIdentifier) as! DepartmentTableViewCell
        result.label.text = departments[indexPath.row].displayName
        return result
    }

}

extension String {
    
    static let departmentTableViewCellIdentifier = "DepartmentTableViewCell"
    static let showItemListSegueIdentifier = "ShowItemListSegue"

}
