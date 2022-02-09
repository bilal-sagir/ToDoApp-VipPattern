//
//  ItemDetailPresentation.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//

import Foundation

struct ItemDetailPresentation{
    let title: String
    
    init(title: String){
        self.title = title
    }
    
    init(item: Item){
        self.init(title: item.title ?? "")
    }
}
