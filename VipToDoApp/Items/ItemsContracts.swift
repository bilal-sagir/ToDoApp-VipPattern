//
//  Contracts.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation


protocol ItemsInteractorProtocol{
    func viewDidLoad()
    func beginEditing()
    func endEditing()
    func cancelButtonClicked()
    func searchButtonClicked()
    func textDidChange(searchText: String)
}

protocol ItemsRouterProtocol{
    
}

protocol ItemsDataPassingProtocol{
}

enum ItemsInteractorOutput{
    case showItems([Item])
    case searchBar(searchActive: Bool, showCancelButton: Bool)
    case endEditing(searchActive: Bool, showCancelButton: Bool, searchBarText: String?)
    case cancelButton(searchActive: Bool)
    case textDidChange(searchActive: Bool, filteredList: [Item])
}

protocol ItemsPresenterProtocol{
    func handleOutput(_ output: ItemsInteractorOutput)
}

enum ItemsPresenterOutput{
    case showItems([ItemsPresentation])
    case searchBar(searchActive: Bool, showCancelButton: Bool)
    case endEditing(searchActive: Bool, showCancelButton: Bool, searchBarText: String?)
    case cancelButton(searchActive: Bool)
    case textDidChange(searchActive: Bool, filteredList: [ItemsPresentation])
}

protocol ItemsViewProtocol: NSObject{
    func handleOutput(_ output: ItemsPresenterOutput)
}

enum ItemRoute{
    case showItemDetail(item: ItemsPresentation)
}

protocol ItemsRoutingProtocol{
    func navigate(to route: ItemRoute)
}
