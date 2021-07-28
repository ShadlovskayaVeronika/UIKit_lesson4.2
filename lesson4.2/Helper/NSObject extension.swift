//
//  NSObject extension.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 27.07.2021.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
