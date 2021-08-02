//
//  FooterView.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class FooterView: UITableViewHeaderFooterView {

    let button = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)!
    }
    
    func configureContents() {
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)


        // Constrains
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
        
        contentView.backgroundColor = UIColor.white
        button.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 1)
    }

}
