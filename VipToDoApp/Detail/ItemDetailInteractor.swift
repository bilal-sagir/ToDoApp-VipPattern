//
//  ItemDetailInteractor.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//
import Foundation

class ItemDetailInteractor: ItemDetailInteractorProtocol, ItemDetailDataStoreProtocol{
    let dataworker: CoreDataServiceProtocol
    let notificationWorker: LocalNotificationServiceProtocol
    init(dataworker: CoreDataServiceProtocol, notificationWorker: LocalNotificationServiceProtocol){
        self.dataworker = dataworker
        self.notificationWorker = notificationWorker
    }
    
    var item: Item?
    var presenter: ItemDetailPresenterProtocol?
    
    func viewDidLoad() {
        guard let item = item else {return}
        self.presenter?.handleOutput(.showItem(item))
    }
    
    func addNewItem(title: String, detail: String, date: Date) {
        dataworker.createItem(title: title, detail: detail, date: date)
        notificationWorker.addNewNoti(item: dataworker.fetchItem(title: title)!)
        self.presenter?.handleOutput(.returnItemsScreen)
    }

    func editItem(newTitle: String, newDetail: String, newDate: Date) {
        guard let item = item else { return }
        notificationWorker.deleteNoti(item: item)
        dataworker.editItem(item.title!, newTitle: newTitle, newDetail: newDetail, newDate: newDate)
        notificationWorker.addNewNoti(item: item)
        self.presenter?.handleOutput(.returnItemsScreen)
    }
}
