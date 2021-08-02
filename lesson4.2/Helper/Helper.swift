//
//  Helper.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 28.07.2021.
//

import Foundation

class Helper {
    static var app: Helper = {
        return Helper()
    }()
    
    let signInCells: [CellType] = [.inputCell("Email","email"), .inputCell("Пароль", "Пароль")]
    let bookingCells: [CellType] = [.inputCell("ФИО", "Введите фио"),
                                    .inputCell("Количество гостей", "Введите количество"),
                                    .inputCell("Номер стола", "Стол номер"),
                                    .switchCell("Бронировали стол?"),
                                    .switchCell("Предоплата?"),
                                    .switchCell("VIP комната?")]
    let defaultMenuItems: [MenuItem] = [MenuItem(name: "Салат Греческий", ingridients: "Помидор, салат айсберг, сухарики, курица", price: 400),
                                        MenuItem(name: "Салат Цезарь", ingridients: "Помидор, салат, курица, сухарики", price: 300)]
}
