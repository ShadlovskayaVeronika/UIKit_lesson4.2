//
//  CellWithMenuItem.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class CellWithMenuItem: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var itemName = UILabel()
    var price = UILabel()
    var ingridients = UILabel()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.itemName.frame = CGRect(x: 20, y: 10, width: 200, height: 30)
        self.price.frame = CGRect(x: 350, y: 10, width: 50, height: 30)
        self.ingridients.frame = CGRect(x: 20, y: 40, width: 500, height: 21)
       
        self.contentView.addSubview(itemName)
        self.contentView.addSubview(price)
        self.contentView.addSubview(ingridients)

    }
    
    func commonInit(itemName: String, ingridients: String, price: Int)  {
        print("common init")
        self.itemName.text = itemName
        print("self item text: " + self.itemName.text!)
        self.price.text = "\(price) р."
        self.ingridients.text = ingridients
    }

}
