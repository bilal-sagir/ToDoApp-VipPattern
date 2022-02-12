//
//  ItemDetailBuilder.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//

import Foundation

class ItemDetailBuilder{
    static func build() -> ItemDetailViewController{
        let viewController = ItemDetailViewController(nibName: "ItemDetailViewController", bundle: nil)
        let interactor = ItemDetailInteractor(dataworker: appContainer.service, notificationWorker: appContainer.service2)
        let presenter = ItemDetailPresenter()
        let router = ItemDetailRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
