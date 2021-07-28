//
//  String extension.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 27.07.2021.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self)
    }
}


