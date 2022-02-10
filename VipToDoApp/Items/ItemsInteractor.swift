//
//  Interactor.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation
import UIKit

class ItemsInteractor: ItemsInteractorProtocol, ItemsDataStoreProtocol{
    var items: [Item] = []
    
 
    var presenter: ItemsPresenterProtocol?
    
    var searchActive = false
    var showCancelButton = false
    var searchBarText: String?
    
    func viewDidLoad() {
        items = CoreDataRepo.shared.fetchItems()
        self.presenter?.handleOutput(.showItems(items))
    }
    
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
        searchActive = false
        self.presenter?.handleOutput(.cancelButton(searchActive: searchActive))
    }
    

    
    func remItem(indexPath: IndexPath) {
        CoreDataRepo.shared.deleteItem(items[indexPath.row].title!)
        self.presenter?.handleOutput(.reloadTableView)
    }
    
    
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
    
}
