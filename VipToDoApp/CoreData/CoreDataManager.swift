//
//  AppData.swift
//  VipToDoApp
//
//  Created by Bilal on 6.02.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    private init(){ }
    static let shared = CoreDataManager()
    
    var container: NSPersistentContainer = {
        let c = NSPersistentContainer(name: "VipToDoApp")
        c.loadPersistentStores { desc, err in
            if let error = err as NSError?{
                print(error)
            }
        }
        return c
    }()
    
    func saveContext(){
        let context = container.viewContext
        if context.hasChanges{
            do{
                try context.save()
            }catch{
                print("cannot saved -AppData.saveContext is not working")
            }
        }
    }
}
