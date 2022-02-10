//
//  ItemDetailPresentation.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//

import Foundation

struct ItemDetailPresentation{
    let title: String
    let detail: String
    let date: Date
    
    init(title: String, detail: String, date: Date){
        self.title = title
        self.detail = detail
        self.date = date
    }
    
    init(item: Item){
        self.init(title: item.title ?? "bb", detail: item.detail!, date: item.date!)
    }
}
