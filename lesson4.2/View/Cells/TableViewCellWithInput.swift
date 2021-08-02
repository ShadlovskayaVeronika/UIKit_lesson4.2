//
//  TableViewCellWithInput.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class TableViewCellWithInput: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func commonInit(labelText: String, placeholderText: String, textFieldIsSecure: Bool = false){
        label.text = labelText
        textField.isSecureTextEntry = textFieldIsSecure
        textField.placeholder = placeholderText
    }
}

