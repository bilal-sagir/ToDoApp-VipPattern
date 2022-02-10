//
//  ItemDetailContracts.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//

import Foundation


enum ItemDetailPresenterOutput{
    case showItem(ItemDetailPresentation)
}

protocol ItemDetailViewProtocol: NSObject{
    func handleOutput(_ output: ItemDetailPresenterOutput)
}

protocol ItemDetailInteractorProtocol{
    func viewDidLoad()
}

enum ItemDetailRoute{
    case showItemDetail
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
}

protocol ItemDetailPresenterProtocol{
    func handleOutput(_ output: ItemDetailInteractorOutput)
}


