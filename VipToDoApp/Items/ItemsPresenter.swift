//
//  Presenter.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

class ItemsPresenter: ItemsPresenterProtocol{
    
    weak var viewController: ItemsViewProtocol?

    func handleOutput(_ output: ItemsInteractorOutput) {
        switch output {
        case .showItems(let items):
            viewController?.handleOutput(.showItems(items.map(ItemsPresentation.init)))
        }
    }
}
