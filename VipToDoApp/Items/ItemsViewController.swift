//
//  ViewController.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import UIKit

class ItemsViewController: UIViewController, ItemsViewProtocol {

    var interactor: ItemsInteractorProtocol?
    var router: ItemsRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
    }
    
    @IBAction func fetchITem(_ sender: Any) {
        print(CoreDataRepo.shared.fetchItems())
    }
    func handleOutput() {
        
    }

}
