//
//  CheckFooterView.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class CheckFooterView: UITableViewHeaderFooterView {

    let label = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)!
    }
    
    func configureContents() {
        label.frame = CGRect(x: 200, y: 200, width: 200, height: 50)
        label.backgroundColor = UIColor(red: 0.2, green: 0.6, blue: 0.4, alpha: 1)
        label.textAlignment = .center
        label.textColor = UIColor.white
        contentView.addSubview(label)
        contentView.backgroundColor = UIColor.white
    }
    
    func commonInit(labelText: String) {
        label.text = labelText
    }
}
