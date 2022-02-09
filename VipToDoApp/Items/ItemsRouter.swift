//
//  Router.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

class ItemsRouter: ItemsRoutingProtocol{
    weak var viewController: ItemsViewController?
    
    func navigate(to route: ItemRoute) {
        switch route {
        case .showItemDetail(item: let item):
            let destinationVC = ItemDetailBuilder.build(with: item)
            viewController?.show(destinationVC, sender: nil)
        }
    }
    
}
