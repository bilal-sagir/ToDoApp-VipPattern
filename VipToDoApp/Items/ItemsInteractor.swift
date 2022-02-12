//
//  Interactor.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation
import UIKit

class ItemsInteractor: ItemsInteractorProtocol, ItemsDataStoreProtocol{
    let dataworker: CoreDataServiceProtocol
    let notificationWorker: LocalNotificationServiceProtocol
    init(dataworker: CoreDataServiceProtocol, notificationWorker: LocalNotificationServiceProtocol){
        self.dataworker = dataworker
        self.notificationWorker = notificationWorker
    }
    
    var items: [Item] = []
    var presenter: ItemsPresenterProtocol?
    private var searchActive = false
    private var showCancelButton = false
    private var searchBarText: String?
    private var sortStatus = 0
    private var buttonStr = ""
    
    //MARK: - viewDidLoad
    func viewDidLoad() {
        items = dataworker.fetchItems()
        self.presenter?.handleOutput(.showItems(items))
    }
    
    //MARK: - SearchBarDelegates
    func beginEditing() {
        searchActive = true
        showCancelButton = true
        self.presenter?.handleOutput(.searchBar(searchActive: searchActive, showCancelButton: showCancelButton))
    }
    
    func endEditing() {
        searchActive = false
        showCancelButton = false
        searchBarText = nil
        self.presenter?.handleOutput(.endEditing(searchActive: searchActive,
                                                 showCancelButton: showCancelButton,
                                                 searchBarText: searchBarText))
    }
    
    func cancelButtonClicked() {
        searchActive = false
        self.presenter?.handleOutput(.cancelButton(searchActive: searchActive))
    }
    
    func searchButtonClicked() {
        searchActive = true
        self.presenter?.handleOutput(.cancelButton(searchActive: searchActive))
    }
        
    //MARK: - SearchBar textDidChange Logic
    func textDidChange(searchText: String) {
        items = CoreDataRepo.shared.fetchItems()
        var filteredList : Array<Item>
        filteredList = items.filter({ item in
            let tmp: NSString = item.title! as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if filteredList.count == 0 {
            searchActive = false
            self.presenter?.handleOutput(.textDidChange(searchActive: searchActive,
                                                        filteredList: filteredList))
        }else{
            searchActive = true
            self.presenter?.handleOutput(.textDidChange(searchActive: searchActive,
                                                        filteredList: filteredList))
        }
    }
    
    //MARK: - Delete Item
    func remItem(indexPath: IndexPath) {
        notificationWorker.deleteNoti(item: items[indexPath.row])
        dataworker.deleteItem(items[indexPath.row].title!)
        self.presenter?.handleOutput(.reloadTableView)
    }
    
    //MARK: - Sort List Items by Title
    func sortItems() {
        if sortStatus == 0{
            items = items.sorted{ $0.title!.lowercased() < $1.title!.lowercased() }
            sortStatus = 1
            buttonStr = "SortByTitle: ⬇️"
        }else if sortStatus == 1{
            items = items.sorted{ $0.title!.lowercased() > $1.title!.lowercased() }
            sortStatus = 2
            buttonStr = "SortByTitle: ⬆️"
        }else {
            items = dataworker.fetchItems()
            sortStatus = 0
            buttonStr = "SortByTitle"
        }
        self.presenter?.handleOutput(.sortItems(list: items, buttonStr: buttonStr))
    }
    
}
