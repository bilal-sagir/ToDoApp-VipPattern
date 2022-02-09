//
//  ItemDetailContracts.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//

import Foundation


protocol ItemDetailInteractorProtocol{

}



protocol ItemDetailDataPassingProtocol{
}

enum ItemDetailInteractorOutput{

}

protocol ItemDetailPresenterProtocol{
    func handleOutput(_ output: ItemDetailInteractorOutput)
}

enum ItemDetailPresenterOutput{

}

protocol ItemDetailViewProtocol: NSObject{
    func handleOutput(_ output: ItemDetailPresenterOutput)
}

protocol ItemDetailRouterProtocol{
    
}
