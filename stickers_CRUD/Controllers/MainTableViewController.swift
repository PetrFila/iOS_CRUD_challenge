//
//  ViewController.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 9/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var cellIdentifier = "Cell"
    
    var dataInDictionary = [String:[StickerModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        navigationItem.title = "Stickers"

        navigationController?.navigationBar.isTranslucent = false
        
        let addNew = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(moveToAddNewItemScreen))
        
        navigationItem.rightBarButtonItem = addNew
        
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        
        let serviceClass = APICall()
    
        serviceClass.fetchData { sticker, error  in
            
            if let error = error {
                print("Error message from index controller: ", error)
            }
            
           
            self.dataInDictionary = sticker ?? ["stickers":[]]
            print(self.dataInDictionary["stickers"] as Any)
            DispatchQueue.main.async {
            
//                if error != nil {
//                    self.sessionError(title: "Damn", message: error?.localizedDescription ?? "Something went wrong")
//                }
                
//                SVProgressHUD.dismiss()
                self.tableView.isHidden = false
//                UIApplication.shared.endIgnoringInteractionEvents()
                
                
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section
        return dataInDictionary["stickers"]?.count ?? 1
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? MainTableViewCell
            else { return UITableViewCell() }

        let accessData = dataInDictionary["stickers"]
        let dataToRow = accessData?[indexPath.row]
        cell.title = dataToRow?.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailScreen = EditDetailsViewController()
//        let accessData = dataInDictionary["stickers"]!
//        let modelIntheRow = accessData[indexPath.row]
//        titelScreen.modelToDisplay = modelIntheRow
        self.navigationController?.pushViewController(detailScreen, animated: true)

    }
    
    // MARK swipe menu
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Delete"){
            (action, view, completion) in
            self.showActionSheet()
            
            //            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            completion(false)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func showActionSheet() {
        // establish an action sheet
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        // create buttons
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        let delete = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: nil)
        
        // display the buttons in particular order
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        
        // present the action sheet on display
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc func moveToAddNewItemScreen() {
        show(AddNewItemViewController(), sender: self)
    }
    
}

//EABC..BAB...GG....DEF...EDE....CB......low A....
