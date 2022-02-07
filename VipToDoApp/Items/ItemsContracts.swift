//
//  Contracts.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

protocol ItemsInteractorProtocol{
    func viewDidLoad()
}

typealias ItemsRouterProtocol = ItemsRoutingProtocol & ItemsDataPassingProtocol

protocol ItemsRoutingProtocol{
    func navigate()
}

protocol ItemsDataPassingProtocol{
}

protocol ItemsPresenterProtocol{
    func handeOutput()
}

protocol ItemsViewProtocol: NSObject{
    func handleOutput()
}

protocol ItemsDataStoreProtocol{
    
}
