//
//  ViewController.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cells: [CellType] = Helper.app.signInCells
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Кафе".localized()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellWithInput = UINib(nibName: TableViewCellWithInput.className, bundle: nil)
        tableView.register(cellWithInput, forCellReuseIdentifier: "cellWithInput")
        tableView.register(FooterView.self, forHeaderFooterViewReuseIdentifier: "signInFooter")
        
        let header = SignInHeader()
        header.frame.size.height = 300
        tableView.tableHeaderView = header
        tableView.sectionFooterHeight = 200
        tableView.rowHeight = 80
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithInput", for: indexPath) as! TableViewCellWithInput
       
        guard case .inputCell(let labelText, let placeholder) = cells[indexPath.item] else{
            return cell
        }
        cell.label.text = labelText.localized()
        cell.textField.placeholder = placeholder.localized()
        if labelText == "Пароль" {
            cell.textField.isSecureTextEntry = true
        }
        return cell
    }
   
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                      "signInFooter") as! FooterView
        view.button.setTitle("Войти".localized(), for: .normal)
        view.button.addTarget(
            self,
            action: #selector(buttonTapped(_:)),
            for: .touchUpInside)
        return view
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let vc = BookingViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate {
    
}
