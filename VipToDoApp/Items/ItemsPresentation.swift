//
//  Presentation.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

struct ItemsPresentation{
    let id: String
    let title: String
    
    init(id: String, title: String){
        self.id = id
        self.title = title
    }
    
    init(item: Item){
        self.init(id: item.id!, title: item.title ?? "")
    }
}
