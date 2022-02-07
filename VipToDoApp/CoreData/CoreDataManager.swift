//
//  CreateItem.swift
//  VipToDoApp
//
//  Created by Bilal on 6.02.2022.
//

import Foundation
import CoreData

struct CoreDataManager{
    var context: NSManagedObjectContext = AppData.shared.container.viewContext
    static let shared = CoreDataManager()
    
    //MARK: - Create Item (Core Data)
    func createItem(title: String, detail: String, date: Date){
        let item = Item(context: context)
        item.title = title
        item.detail = detail
        item.date = date
        AppData.shared.saveContext()
    }
    
    //MARK: - Fetch All Items (Core Data)
    func fetchItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")

        do{
            let res = try context.fetch(request)

            for data in res as! [NSManagedObject]{
                let item = data as! Item
                print(item.title as Any)
                print(item.detail as Any)
                print(item.date as Any)
                print("--")
            }
        }
        catch{
            print(error)
            print("fetchItem Error")
        }
    }
    
    //MARK: - Delete Item (Core Data)
    func deleteItem(_ title: String){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        
        let predicate = NSPredicate(format: "title == %@", title)
        
        request.predicate = predicate
        
        do{
            let result = try context.fetch(request)
            let resultData = result as! [Item]
            for any in resultData{
                context.delete(any)
            }
            try context.save()
        }catch{
            print(error)
            print("deleteItem Error")
        }
    }
    
    //MARK: - Edit Item (Core Data)
    func editItem(_ editItem: String, title: String?, detail: String?, date: Date?){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        
        let predicate = NSPredicate(format: "title == %@", editItem)
        
        request.predicate = predicate
        
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                let item = data as! Item
                item.title = title == nil ? item.title : title
                item.detail = detail == nil ? item.detail : detail
                item.date = date == nil ? item.date : date
                AppData.shared.saveContext()
            }
        }catch{
            print(error)
            print("editItem Error")
        }
    }
}
