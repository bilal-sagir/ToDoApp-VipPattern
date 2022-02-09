//
//  CreateItem.swift
//  VipToDoApp
//
//  Created by Bilal on 6.02.2022.
//

import Foundation
import CoreData

struct CoreDataRepo{
    var context: NSManagedObjectContext = CoreDataManager.shared.container.viewContext
    static let shared = CoreDataRepo()
    
    //MARK: - Create Item (Core Data)
    func createItem(title: String, detail: String, date: Date){
        let item = Item(context: context)
        item.title = title
        item.detail = detail
        item.date = date
        CoreDataManager.shared.saveContext()
    }
    
    //MARK: - Fetch All Items (Core Data)
    func fetchItems() -> [Item]{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")

        do{
            let res = try context.fetch(request)
            
            
            return(res as? [Item] ?? [])
        }
        catch{
            print(error)
            print("fetchItem Error")
            return []
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
    func editItem(_ editItemTitle: String, newTitle: String?, newDetail: String?, newDate: Date?){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        
        let predicate = NSPredicate(format: "title == %@", editItemTitle)
        
        request.predicate = predicate
        
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]{
                let item = data as! Item
                item.title = newTitle == nil ? item.title : newTitle
                item.detail = newDetail == nil ? item.detail : newDetail
                item.date = newDate == nil ? item.date : newDate
                CoreDataManager.shared.saveContext()
            }
        }catch{
            print(error)
            print("editItem Error")
        }
    }
}
