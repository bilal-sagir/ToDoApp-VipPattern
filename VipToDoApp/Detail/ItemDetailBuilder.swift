//
//  ItemDetailBuilder.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//

import Foundation

class ItemDetailBuilder{
    static func build(with: ItemsPresentation) -> ItemDetailViewController{
        let viewController = ItemDetailViewController(nibName: "ItemDetailViewController", bundle: nil)
        let interactor = ItemDetailInteractor()
        let presenter = ItemDetailPresenter()
        let router = ItemDetailRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        //router.dataStore = interactor
        
        return viewController
    }
}
