//
//  Builder.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

class ItemsBuilder{
    static func build() -> ItemsViewController{
        let viewController = ItemsViewController(nibName: "ItemsViewController", bundle: nil)
        let interactor = ItemsInteractor(dataworker: appContainer.service, notificationWorker: appContainer.service2)
        let presenter = ItemsPresenter()
        let router = ItemsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
}
