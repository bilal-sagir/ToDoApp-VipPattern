//
//  ViewController.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//

import UIKit

class ItemsViewController: UIViewController, ItemsViewProtocol {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
        }
    }
    
    var interactor: ItemsInteractorProtocol?
    var router: ItemRouterProtocol?
    
    private var items: [ItemsPresentation] = []
    private var filteredList: [ItemsPresentation] = []
    private var searchActive = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.viewDidLoad()
    }
    

    @IBAction func addNewItem(_ sender: UIButton) {
           
    }
    
    func handleOutput(_ output: ItemsPresenterOutput) {
        switch output {
            
            //MARK: - Fetch data
        case .showItems(let items):
            self.items = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            //MARK: - SEARCHBAR
        case .searchBar(searchActive: let searchActive, showCancelButton: let showCancelButton):
            self.searchActive = searchActive
            self.searchBar.showsCancelButton = showCancelButton
            
        case .endEditing(searchActive: let searchActive, showCancelButton: let showCancelButton, searchBarText: let searchBarText):
            self.searchActive = searchActive
            self.searchBar.showsCancelButton = showCancelButton
            self.searchBar.text = searchBarText
            self.searchBar.resignFirstResponder()
            self.tableView.reloadData()
            
        case .cancelButton(searchActive: let searchActive):
            self.searchActive = searchActive
            self.searchBar.resignFirstResponder()
            
        case .textDidChange(searchActive: let searchActive, filteredList: let filteredList):
            self.searchActive = searchActive
            self.filteredList = filteredList
            self.tableView.reloadData()
        }
    }
}
//MARK: - TableView Data Source
extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        if searchActive && self.searchBar.text != ""{
            cell.textLabel?.text = self.filteredList[indexPath.row].title
        }else{
            cell.textLabel?.text = items[indexPath.row].title
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchActive){
            return self.filteredList.count
        }
        return items.count
    }
}
//MARK: - TableView Delegate
extension ItemsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchActive && searchBar.text != ""{
            router?.navigate(to: .showItemDetail(index: indexPath.row))
            print(indexPath.row)
        }else{
            router?.navigate(to: .showItemDetail(index: indexPath.row))
            print(indexPath.row)
        }
    }
}

// MARK: - SearchBar Config
extension ItemsViewController: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        interactor?.beginEditing()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        interactor?.endEditing()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        interactor?.cancelButtonClicked()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        interactor?.searchButtonClicked()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        interactor?.textDidChange(searchText: searchText)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
