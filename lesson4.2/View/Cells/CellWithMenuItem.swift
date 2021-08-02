//
//  CellWithMenuItem.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class CellWithMenuItem: UITableViewCell {
    
    lazy var itemName: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 10, width: 200, height: 30)
        return label
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 350, y: 10, width: 50, height: 30)
        return label
    }()
    
    lazy var ingridients: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 40, width: 500, height: 21)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureContents(){
        self.contentView.addSubview(itemName)
        self.contentView.addSubview(price)
        self.contentView.addSubview(ingridients)
    }
    
    func commonInit(menuItem: MenuItem)  {
        self.itemName.text = menuItem.name
        self.price.text = "\(menuItem.price) р."
        self.ingridients.text = menuItem.ingridients
    }

}
