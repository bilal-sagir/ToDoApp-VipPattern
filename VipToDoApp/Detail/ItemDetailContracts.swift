//
//  ItemDetailContracts.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//
import Foundation

enum ItemDetailPresenterOutput{
    case showItem(ItemDetailPresentation)
    case returnItemsScreen
    case checkEmptyTitleTxtFld(isEmptyValue: Bool)
}

protocol ItemDetailViewProtocol: NSObject{
    func handleOutput(_ output: ItemDetailPresenterOutput)
}

protocol ItemDetailInteractorProtocol{
    func viewDidLoad()
    func addNewItem(title: String, detail: String, date: Date)
    func editItem(newTitle: String, newDetail: String, newDate: Date)
    func checkEmptyTitleTxtFld(text: String, range: NSRange, string: String)
}

enum ItemDetailRoute{
    case reloadTableView
}

typealias ItemDetailRouterProtocol = ItemDetailRoutingProtocol & ItemDetailDataPassingProtocol

protocol ItemDetailDataStoreProtocol{
    var item: Item? { get set }
}

protocol ItemDetailDataPassingProtocol{
    var dataStore: ItemDetailDataStoreProtocol? { get }
}

protocol ItemDetailRoutingProtocol{
    func navigate(to route: ItemDetailRoute)
}

enum ItemDetailInteractorOutput{
    case showItem(Item)
    case returnItemsScreen
    case checkEmptyTitleTxtFld(isEmptyValue: Bool)
}

protocol ItemDetailPresenterProtocol{
    func handleOutput(_ output: ItemDetailInteractorOutput)
}
