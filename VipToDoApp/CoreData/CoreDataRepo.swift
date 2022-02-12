//
//  CreateItem.swift
//  VipToDoApp
//
//  Created by Bilal on 6.02.2022.
//
import CoreData

protocol CoreDataServiceProtocol{
    func createItem(title: String, detail: String, date: Date) -> Item
    func fetchItems() -> [Item]
    func fetchItem(id: String) -> Item?
    func deleteItem(_ id: String)
    func editItem(_ id: String, newTitle: String?, newDetail: String?, newDate: Date?)
}

class CoreDataRepo: CoreDataServiceProtocol{
    
    var context: NSManagedObjectContext = CoreDataManager.shared.container.viewContext
    static let shared = CoreDataRepo()
    
    //MARK: - Create Item (Core Data)
    func createItem(title: String, detail: String, date: Date) -> Item {
        let item = Item(context: context)
        item.id = UUID().uuidString
        item.title = title
        item.detail = detail
        item.date = date
        CoreDataManager.shared.saveContext()
        
        return item
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
            return []
        }
    }
    
    func fetchItem(id: String) -> Item?{
        var item: Item?
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let predicate = NSPredicate(format: "id == %@", id)
        request.predicate = predicate
        do{
            let res = try context.fetch(request)
            let resData = res as! [Item]
            for any in resData{
                item = any
            }
        }catch{
            print("fetchItem Error")
            item = nil
        }
        return item
    }
    
    //MARK: - Delete Item (Core Data)
    func deleteItem(_ id: String){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let predicate = NSPredicate(format: "id == %@", id)
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
    func editItem(_ id: String, newTitle: String?, newDetail: String?, newDate: Date?){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        let predicate = NSPredicate(format: "id == %@", id)
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
