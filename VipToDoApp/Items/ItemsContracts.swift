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

protocol ItemsRouterProtocol{
    
}

protocol ItemsDataPassingProtocol{
}

protocol ItemsPresenterProtocol{
    func handleOutput()
}

protocol ItemsViewProtocol: NSObject{
    func handleOutput()
}

struct ToDoItem{
    let title: String
    let detail: String
    let date: Date
}

protocol ItemsDataStoreProtocol{
    func createItem(todo: ToDoItem)
    func fetchItems() -> [ToDoItem]
    func deleteItem(title: String) -> Bool
    func editItem(title: String, item: ToDoItem?) -> Bool
}
