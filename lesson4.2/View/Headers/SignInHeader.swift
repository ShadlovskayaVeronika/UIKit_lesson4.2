//
//  SignInHeader.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 26.07.2021.
//

import UIKit

class SignInHeader: UITableViewHeaderFooterView {
    let imageView = UIImageView()
    let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 1)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)!
    }
    
    func configureContents() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(title)
        contentView.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            title.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            title.heightAnchor.constraint(equalToConstant: 50),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
           ])
       

        contentView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "Logo")
        title.text = "Sign In"
       }
}
