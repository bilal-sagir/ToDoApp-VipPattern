//
//  ItemDetailRouter.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//

import Foundation

class ItemDetailRouter: NSObject, ItemDetailRouterProtocol{
    weak var viewController: ItemDetailViewController?
    var dataStore: ItemDetailDataStoreProtocol?
    
    func navigate(to route: ItemDetailRoute) {
        switch route {
        case .reloadTableView:
            NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil) // PAIN no2 !!
        }
    }
}
