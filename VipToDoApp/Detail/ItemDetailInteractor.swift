//
//  ItemDetailInteractor.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//
import Foundation

class ItemDetailInteractor: ItemDetailInteractorProtocol, ItemDetailDataStoreProtocol{
    var item: Item?
    var presenter: ItemDetailPresenterProtocol?
    
    func viewDidLoad() {
        guard let item = item else {return}
        self.presenter?.handleOutput(.showItem(item))
    }
    
    func addNewItem(title: String, detail: String, date: Date) {
        CoreDataRepo.shared.createItem(title: title, detail: detail, date: date)
        LocalNotificationManager.addNewNoti(item: CoreDataRepo.shared.fetchItem(title: title)!)
        self.presenter?.handleOutput(.returnItemsScreen)
    }

    func editItem(newTitle: String, newDetail: String, newDate: Date) {
        LocalNotificationManager.deleteNoti(item: item!)
        CoreDataRepo.shared.editItem((item?.title!)!, newTitle: newTitle, newDetail: newDetail, newDate: newDate)
        LocalNotificationManager.addNewNoti(item: item!)
        self.presenter?.handleOutput(.returnItemsScreen)
    }
}
