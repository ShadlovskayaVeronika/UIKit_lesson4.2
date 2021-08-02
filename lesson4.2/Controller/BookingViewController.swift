//
//  BookingViewController.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class BookingViewController: UITableViewController {

    let cells = Helper.app.bookingCells
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = "Бронирование".localized()
        self.clearsSelectionOnViewWillAppear = false
        
        registerCells()

        tableView.sectionFooterHeight = 200
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.rowHeight = 70
    }
    
    func registerCells() {
        let cellWithInput = UINib(nibName: TableViewCellWithInput.className, bundle: nil)
       
        tableView.register(cellWithInput, forCellReuseIdentifier: "cellWithInput")
        tableView.register(TableViewCellWithSwitch.self, forCellReuseIdentifier: "cellWithSwitch")
        tableView.register(FooterView.self, forHeaderFooterViewReuseIdentifier: "footer")
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                      "footer") as! FooterView
        view.button.setTitle("Выдать чек".localized(), for: .normal)
        view.button.addTarget(
            self,
            action: #selector(buttonTapped(_:)),
            for: .touchUpInside)
        return view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cells[indexPath.item]{
        case .inputCell(let labelText, let placeholder):
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithInput", for: indexPath) as! TableViewCellWithInput
            cell.commonInit(labelText: labelText.localized(), placeholderText: placeholder.localized())
            return cell
        case .switchCell(let labelText):
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithSwitch", for: indexPath) as! TableViewCellWithSwitch
            cell.commonInit(labelText: labelText.localized())
            return cell
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Выставить чек?".localized(), message: "", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Чек".localized(), style: .default, handler: { (action: UIAlertAction!) in
            let vc = CheckViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }))

        alert.addAction(UIAlertAction(title: "Отмена".localized(), style: .cancel, handler: { _ in }))
        
        present(alert, animated: true, completion: nil)
    }
}
