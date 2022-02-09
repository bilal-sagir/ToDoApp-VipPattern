//
//  ViewController.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import UIKit

class ItemsViewController: UIViewController, ItemsViewProtocol {

    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        }
    }

    var interactor: ItemsInteractorProtocol?
    var router: ItemsRouterProtocol?

    private var items: [ItemsPresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        interactor?.viewDidLoad()
    }
    
    @IBAction func fetchITem(_ sender: Any) {
        print(CoreDataRepo.shared.fetchItems())
    }
    
    
    func handleOutput(_ output: ItemsPresenterOutput) {
        switch output {
        case .showItems(let items):
            self.items = items
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        return cell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
}
