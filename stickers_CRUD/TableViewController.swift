//
//  ViewController.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 9/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
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
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // Configure the cell..
//        cell.textLabel?.text = restaurantNames[indexPath.row]
//        cell.imageView?.image = UIImage(named: restaurantPics[indexPath.row])
        cell.backgroundColor = UIColor.brown
        return cell
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
}

