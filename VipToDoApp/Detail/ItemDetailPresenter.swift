//
//  ItemDetailPresenter.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//

import Foundation

class ItemDetailPresenter: ItemDetailPresenterProtocol{
    weak var viewController: ItemDetailViewProtocol?
    
    func handleOutput(_ output: ItemDetailInteractorOutput) {
        switch output {
        case .showItem(let item):
            viewController?.handleOutput(.showItem(ItemDetailPresentation(item: item)))
        }
    }
    
    
    
}
