//
//  Router.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

class ItemsRouter: ItemRouterProtocol{
    
    weak var viewController: ItemsViewController?
    
    var dataStore: ItemsDataStoreProtocol?
    
    func navigate(to route: ItemRoute) {
        switch route {
        case .showItemDetail(index: let index):
            if let items = dataStore?.items{
                let item = items[index]
                let destinationVC = ItemDetailBuilder.build()
                var destinationDataStore = destinationVC.router?.dataStore
                destinationDataStore?.item = item
                viewController?.present(destinationVC, animated: true, completion: nil)
            }

        case .createNewItem:
            let destinationVC = ItemDetailBuilder.build()
            viewController?.present(destinationVC, animated: true, completion: nil)
            
            destinationVC.titleLbl.isHidden = true
            destinationVC.detailLbl.isHidden = true
            destinationVC.dateLbl.isHidden = true
            destinationVC.editButton.isHidden = true
            
            
        }
    }
    
}
