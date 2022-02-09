//
//  Contracts.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

enum ItemsInteractorOutput{
    case showItems([Item])
}
protocol ItemsInteractorProtocol{
    func viewDidLoad()
}

protocol ItemsRouterProtocol{
    
}

protocol ItemsDataPassingProtocol{
}

protocol ItemsPresenterProtocol{
    func handleOutput(_ output: ItemsInteractorOutput)
}

enum ItemsPresenterOutput{
    case showItems([ItemsPresentation])
}

protocol ItemsViewProtocol: NSObject{
    func handleOutput(_ output: ItemsPresenterOutput)
}

struct ToDoItem{
    let title: String
    let detail: String
    let date: Date
}

protocol ItemsDataStoreProtocol{
    func createItem(todo: ToDoItem)
    func fetchItems() -> [Item]
    func deleteItem(title: String) -> Bool
    func editItem(title: String, item: ToDoItem?) -> Bool
}
