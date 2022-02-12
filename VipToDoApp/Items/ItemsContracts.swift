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
    case reloadTableView
    case sortItems(items: [ItemsPresentation], buttonStr: String)
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
    func remItem(indexPath: IndexPath)
    func sortItems()
}

enum ItemRoute{
    case showItemDetail(title: String)
    case createNewItem
}

typealias ItemRouterProtocol = ItemsRoutingProtocol & ItemsDataPassingProtocol

protocol ItemsDataStoreProtocol{
    var items: [Item] {get set }
}
protocol ItemsDataPassingProtocol{
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
    case reloadTableView
    case sortItems(list: [Item], buttonStr: String)
}

protocol ItemsPresenterProtocol{
    func handleOutput(_ output: ItemsInteractorOutput)
}

