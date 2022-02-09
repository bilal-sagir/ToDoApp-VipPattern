//
//  Presentation.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import Foundation

struct ItemsPresentation{
    let title: String
    
    init(title: String){
        self.title = title
    }
    
    init(item: Item){
        self.init(title: item.title ?? "")
    }
}
