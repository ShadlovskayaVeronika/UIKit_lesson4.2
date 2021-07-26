//
//  ViewController.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cafe"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let cellWithInput = UINib(nibName: "TableViewCellWithInput", bundle: nil)
        tableView.register(cellWithInput, forCellReuseIdentifier: "cellWithInput")
        tableView.register(FooterView.self, forHeaderFooterViewReuseIdentifier: "signInFooter")
        
        let header = SignInHeader()
        header.frame.size.height = 300
        tableView.tableHeaderView = header
        tableView.sectionFooterHeight = 200
        tableView.rowHeight = 80
    }
    
    enum CellType{
        case email(String)
        case password(String)
    }
    let cells: [CellType] = [.email("email"), .password("пароль")]
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithInput", for: indexPath) as! TableViewCellWithInput
       
        switch cells[indexPath.item]{
        case .email(let labelText):
            cell.commonInit(labelText: labelText, placeholderText: "email")
        case .password(let labelText):
            cell.commonInit(labelText: labelText, placeholderText: "пароль", textFieldIsSecure: true)

        }
        return cell
    }
   
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                      "signInFooter") as! FooterView
        view.button.setTitle("Войти", for: .normal)
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
