//
//  MenuItemsPresenter.swift
//  lesson4.2
//
//  Created by Veronika Shadlovskaya on 27.07.2021.
//

import Foundation
import SwiftUI
import Combine

class MenuItemsPresenter: ObservableObject {
    private let interactor: MenuItemsIteractor
    @Published var menuItems: [MenuItem] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: MenuItemsIteractor) {
        self.interactor = interactor
        interactor.model.$menuItems
          .assign(to: \.menuItems, on: self)
          .store(in: &cancellables)

    }
}
