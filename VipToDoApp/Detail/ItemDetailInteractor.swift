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
        let createdItem = dataworker.createItem(title: title.trimmingCharacters(in: .whitespacesAndNewlines), detail: detail, date: date)
        notificationWorker.addNewNoti(item: dataworker.fetchItem(id: createdItem.id!)!)
        self.presenter?.handleOutput(.returnItemsScreen)
    }

    func editItem(newTitle: String, newDetail: String, newDate: Date) {
        guard let item = item else { return }
        notificationWorker.deleteNoti(id: item.id!)
        dataworker.editItem(item.id!, newTitle: newTitle.trimmingCharacters(in: .whitespacesAndNewlines), newDetail: newDetail, newDate: newDate)
        notificationWorker.addNewNoti(item: item)
        self.presenter?.handleOutput(.returnItemsScreen)
    }
    
    func checkEmptyTitleTxtFld(text: String, range: NSRange, string: String) {
        
        let newText = (text as NSString).replacingCharacters(in: range, with: string).trimmingCharacters(in: .whitespacesAndNewlines)
        let itemEmpty = !newText.isEmpty
        self.presenter?.handleOutput(.checkEmptyTitleTxtFld(isEmptyValue: itemEmpty))
    }
}
