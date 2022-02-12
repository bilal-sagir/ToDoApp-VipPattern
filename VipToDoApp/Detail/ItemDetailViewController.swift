//
//  ItemDetailViewController.swift
//  VipToDoApp
//
//  Created by Bilal on 10.02.2022.
//
import UIKit

class ItemDetailViewController: UIViewController, ItemDetailViewProtocol {

    var interactor: ItemDetailInteractorProtocol?
    var router: ItemDetailRouterProtocol?
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var titleTxtFld: UITextField!
    @IBOutlet weak var detailTxtFld: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var SaveChanges: UIButton!
    
    private var buttonIsSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.viewDidLoad()
    }

    func handleOutput(_ output: ItemDetailPresenterOutput) {
        switch output {
        case .showItem(let item):
            titleLbl.text = item.title
            detailLbl.text = item.detail
            dateLbl.text = Date().dateToString(date: item.date)
            
            titleTxtFld.isHidden = true
            detailTxtFld.isHidden = true
            datePicker.isHidden = true
            addButton.isHidden = true
            SaveChanges.isHidden = true
        
        case .returnItemsScreen:
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        interactor?.addNewItem(title: titleTxtFld.text!, detail: detailTxtFld.text!, date: datePicker.date)
        buttonIsSelected = true
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        titleTxtFld.isHidden = false
        titleTxtFld.text = titleLbl.text
        detailTxtFld.isHidden = false
        detailTxtFld.text = detailLbl.text
        datePicker.isHidden = false

        let dateF = DateFormatter()
        dateF.dateFormat = "dd-MM-yyyy HH:mm"
        datePicker.date = dateF.date(from: dateLbl.text!)!
        
        titleLbl.isHidden = true
        detailLbl.isHidden = true
        dateLbl.isHidden = true
        
        addButton.isHidden = true
        editButton.isHidden = true
        SaveChanges.isHidden = false
        buttonIsSelected = true
    }
    
    @IBAction func saveChangesTapped(_ sender: Any) {
        interactor?.editItem(newTitle: titleTxtFld.text!, newDetail: detailTxtFld.text!, newDate: datePicker.date)
    }
    
    //MARK: - decided reloadTableView
    deinit{
        if buttonIsSelected{
            self.router!.navigate(to: .reloadTableView)
            buttonIsSelected = false
        }
    }
}

