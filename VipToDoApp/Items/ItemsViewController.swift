//
//  ViewController.swift
//  VipToDoApp
//
//  Created by Bilal on 7.02.2022.
//
import UIKit

class ItemsViewController: UIViewController, ItemsViewProtocol {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortButton: UIButton!
    
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
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: NSNotification.Name("reload"), object: nil)
        searchBar.backgroundImage = UIImage()
        interactor?.viewDidLoad()
    }
    
    @objc func reloadTableView(){
        interactor?.viewDidLoad()
    }
    
    @IBAction func sortItems(_ sender: Any) {
        interactor?.sortItems()
    }
    @IBAction func addNewItem(_ sender: UIButton) {
        router?.navigate(to: .createNewItem)
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
 
            //MARK: - tableReloadData
        case .reloadTableView:
            interactor?.viewDidLoad()
        
            //MARK: - sortItems
        case .sortItems(items: let items, buttonStr: let buttonStr):
            self.items = items
            sortButton.setTitle(buttonStr, for: UIControl.State.normal)
            self.tableView.reloadData()
        }
    }
}

//MARK: - TableView Data Source
extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        
        cell.backgroundColor = UIColor(red: 0.149, green: 0.275, blue: 0.325, alpha: 1.0)
        cell.textLabel?.textColor = UIColor(red: 0.914, green: 0.769, blue: 0.416, alpha: 1.0)
        let bgView = UIView()
        bgView.backgroundColor = UIColor(red: 0.914, green: 0.769, blue: 0.416, alpha: 0.20)
        cell.selectedBackgroundView = bgView
        
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
        tableView.deselectRow(at: indexPath, animated: true)
        if searchActive && searchBar.text != ""{
            let id = filteredList[indexPath.row].id
            router?.navigate(to: .showItemDetail(id: id))
        }else{
            let id = items[indexPath.row].id
            router?.navigate(to: .showItemDetail(id: id))
        }
    }
    
    //MARK: - Swipe to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        interactor?.remItem(indexPath: indexPath)
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
