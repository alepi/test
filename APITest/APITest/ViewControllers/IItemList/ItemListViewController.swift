//
//  ItemListViewController.swift
//  APITest
//
//  Created by yawmoo_ext on 08/11/22.
//

import UIKit

class ItemListViewController: UIViewController {

    var viewModel: ItemListViewModel!

    var department: Department! {
        didSet {
            title = department.displayName
        }
    }
 
    var maxItemsCount = 0
    var itemIDs: [Int] = [] {
        didSet {
            // let's use only 10 items, otherwise it will be too many requests!!!
            maxItemsCount = min(10, itemIDs.count)
            fetchNextItem()
        }
    }

    var items: [Int:Item] = [:] {
        didSet {
            tableView.reloadData()
            fetchNextItem()
        }
    }
    
    // this is a "hack" that I used due to the structure of the API itself.
    // the API does return itemIDs instead of items for a department, which
    // means that I have to retrieve each individual item with a separate call
    //
    // This kind of breaks the typical reactive style code structure.
    // I cannot just retrieve all items in a for loop in the model layer,
    // otherwise I may get weird results due to replacing the value of the same variable
    // from different threads at the same time.
    //
    // Typically this would mean having only one item in the items dictionary.
    // To do it properly would require more time than I have in this case, so I decided to just download each item
    // after the previous one has been displayed.
    //
    // I could have done something similar in the model layer but the problem is essentially the same
    private func fetchNextItem() {
        for i in 0..<maxItemsCount {
            let itemID = itemIDs[i]
            if items[itemID] == nil {
                DataController.defaultInstance.updateItem(for: itemID)
                break
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ItemListViewModel(self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if itemIDs.count == 0 {
            DataController.defaultInstance.updateItemIDs(for: department)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if animated, let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.scrollToRow(at: indexPathForSelectedRow, at: .middle, animated: true)
            tableView.deselectRow(at: indexPathForSelectedRow, animated: false)
        }
    }
    
}

extension ItemListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ItemListViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return maxItemsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = tableView.dequeueReusableCell(withIdentifier: .itemTableViewCellIdentifier) as! ItemTableViewCell
        let itemID = itemIDs[indexPath.row]
        result.label.text = items[itemID]?.title
        return result
    }

}

extension String {
    
    static let itemTableViewCellIdentifier = "ItemTableViewCell"
//    static let showItemListSegueIdentifier = "ShowItemListSegue"

}
