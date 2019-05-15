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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        navigationItem.title = "Stickers"

        navigationController?.navigationBar.isTranslucent = false
        
        let addNew = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(moveToAddNewItemScreen))
        
        navigationItem.rightBarButtonItem = addNew
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section
        // return restaurantNames.count
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Configure the cell..
//        cell.textLabel?.text = restaurantNames[indexPath.row]
//        cell.imageView?.image = UIImage(named: restaurantPics[indexPath.row])
        cell.backgroundColor = UIColor.brown
        return cell
    }
    
    // swipe menu
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Delete"){
            (action, view, completion) in
            self.showActionSheet()

//            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            completion(false)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let titelScreen = TitleViewController()
        // same approach as above
        // looping through the dataArray using indexPath and assigning the data to our model on the Detail screen
//        let modelIntheRow = dataInArray[indexPath.row]
//        titelScreen.modelToDisplay = modelIntheRow
        
        self.navigationController?.pushViewController(titelScreen, animated: true)
    }

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
  
    @objc func moveToAddNewItemScreen() {
        show(AddNewItemViewController(), sender: self)
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
    
    
}

