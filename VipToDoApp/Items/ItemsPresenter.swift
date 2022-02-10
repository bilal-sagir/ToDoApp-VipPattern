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

        case .searchBar(searchActive: let searchActive, showCancelButton: let showCancelButton):
            viewController?.handleOutput(.searchBar(searchActive: searchActive, showCancelButton: showCancelButton))
        
        case .endEditing(searchActive: let searchActive, showCancelButton: let showCancelButton, searchBarText: let searchBarText):
            viewController?.handleOutput(.endEditing(searchActive: searchActive,
                                                     showCancelButton: showCancelButton,
                                                     searchBarText: searchBarText))
        
        case .cancelButton(searchActive: let searchActive):
            viewController?.handleOutput(.cancelButton(searchActive: searchActive))
        
      
        case .textDidChange(searchActive: let searchActive, filteredList: let filteredList):
            viewController?.handleOutput(.textDidChange(searchActive: searchActive, filteredList: filteredList.map(ItemsPresentation.init)))
        

        case .reloadTableView:
            viewController?.handleOutput(.reloadTableView)
        }
    }
}
