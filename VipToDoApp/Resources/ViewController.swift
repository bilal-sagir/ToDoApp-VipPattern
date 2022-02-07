//
//  ViewController.swift
//  VipToDoApp
//
//  Created by Bilal on 6.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //CreateItem.shared.createItem(title: "taha", detail: "detail more", date: Date())
        //CreateItem.shared.deleteItem("bilal")
        //CreateItem.shared.editItem("bilal", title: "bilal edit", detail: nil, date: nil)
    }

    @IBAction func fetch(_ sender: Any) {
        CreateItem.shared.fetchItems()
    }
    
}

