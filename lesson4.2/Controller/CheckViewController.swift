//
//  CheckViewController.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class CheckViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        tableView.register(CellWithMenuItem.self, forCellReuseIdentifier: "cellWithMenuItem")
        tableView.register(CheckFooterView.self, forHeaderFooterViewReuseIdentifier: "checkFooter")
        tableView.rowHeight = 80
        tableView.sectionFooterHeight = 200
        
    }
    
    var selectedMenuItems: [(String, String, Int)] =
        [("Салат Греческий", "Помидор, салат айсберг, сухарики, курица", 400),
        ("Салат Цезарь", "Помидор, салат, курица, сухарики", 300)]

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedMenuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithMenuItem", for: indexPath) as! CellWithMenuItem
        let (name, ingridients, price) = selectedMenuItems[indexPath.item]
        
        
        cell.commonInit(itemName: name, ingridients: ingridients, price: price)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                      "checkFooter") as! CheckFooterView
        var price = 0
        for item in selectedMenuItems{
            price += item.2
        }
        
        footer.commonInit(labelText: "\(price) р.")
        return footer
    }

}
