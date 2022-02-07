//
//  Router.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

class ItemsRouter: ItemsRouterProtocol{
    weak var viewController: ItemsViewController?
    var dataStore: ItemsDataStoreProtocol?
    
    func navigate() {
        
    }
}
