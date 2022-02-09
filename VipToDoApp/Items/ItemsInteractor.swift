//
//  Interactor.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

class ItemsInteractor: ItemsInteractorProtocol, ItemsDataStoreProtocol{

    var presenter: ItemsPresenterProtocol?
    
    func viewDidLoad() {
        let items = fetchItems()
        self.presenter?.handleOutput(.showItems(items))
    }
    
    func createItem(todo: ToDoItem) {
        CoreDataRepo.shared.createItem(title: todo.title, detail: todo.detail, date: todo.date)
    }
    
    func fetchItems() -> [Item] {
        CoreDataRepo.shared.fetchItems()
    }
    
    func deleteItem(title: String) -> Bool {
        CoreDataRepo.shared.deleteItem(title)
        return true
    }
    
    func editItem(title: String, item: ToDoItem?) -> Bool {
        CoreDataRepo.shared.editItem(title, newTitle: item?.title, newDetail: item?.detail, newDate: item?.date)
        return true
    }
}
