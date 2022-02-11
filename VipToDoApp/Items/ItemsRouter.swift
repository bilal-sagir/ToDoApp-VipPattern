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
        case .showItemDetail(title: let titleString):
            let itemToGo = CoreDataRepo.shared.fetchItem(title: titleString) // PAIN !!
            let destinationVC = ItemDetailBuilder.build()
            var destinationDataStore = destinationVC.router?.dataStore
            destinationDataStore?.item = itemToGo
            viewController?.present(destinationVC, animated: true, completion: nil)

        case .createNewItem:
            let destinationVC = ItemDetailBuilder.build()
            viewController?.present(destinationVC, animated: true, completion: nil)
            
            destinationVC.titleLbl.isHidden = true
            destinationVC.detailLbl.isHidden = true
            destinationVC.dateLbl.isHidden = true
            destinationVC.editButton.isHidden = true
            destinationVC.SaveChanges.isHidden = true
        }
    }
}
