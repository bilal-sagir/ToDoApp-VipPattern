//
//  Contracts.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

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

protocol ItemsInteractorProtocol{
    func viewDidLoad()
    func beginEditing()
    func endEditing()
    func cancelButtonClicked()
    func searchButtonClicked()
    func textDidChange(searchText: String)
}

enum ItemRoute{
    case showItemDetail(index: Int)
}

typealias ItemRouterProtocol = ItemsRoutingProtocol & ItemsDataPassingProtocol

protocol ItemsDataStoreProtocol{
    var items: [Item] {get set }
}
protocol ItemsDataPassingProtocol: AnyObject{
    var dataStore: ItemsDataStoreProtocol? { get }
}

protocol ItemsRoutingProtocol{
    func navigate(to route: ItemRoute)
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

