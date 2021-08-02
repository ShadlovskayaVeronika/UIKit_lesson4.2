//
//  CheckViewController.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class CheckViewController: UITableViewController {

    let menuItems = Helper.app.defaultMenuItems
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        
        tableView.register(CellWithMenuItem.self, forCellReuseIdentifier: "cellWithMenuItem")
        tableView.register(CheckFooterView.self, forHeaderFooterViewReuseIdentifier: "checkFooter")
        tableView.rowHeight = 80
        tableView.sectionFooterHeight = 200
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithMenuItem", for: indexPath) as! CellWithMenuItem
       
        let item = menuItems[indexPath.item]
        cell.commonInit(menuItem: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                      "checkFooter") as! CheckFooterView
        var price = 0
        for item in menuItems{
            price += item.price
        }
        
        footer.commonInit(labelText: "\(price) р.")
        return footer
    }

}
