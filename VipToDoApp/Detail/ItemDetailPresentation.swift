//
//  ItemDetailPresentation.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//
import Foundation

struct ItemDetailPresentation{ //NOT USED. CoreData handles everything. Didn't remove it because of demonstration purposes.
    let id: String
    let title: String
    let detail: String
    let date: Date
    
    init(id: String, title: String, detail: String, date: Date){
        self.id = id
        self.title = title
        self.detail = detail
        self.date = date
    }
    
    init(item: Item){
        self.init(id: item.id!, title: item.title!, detail: item.detail!, date: item.date!)
    }
}
