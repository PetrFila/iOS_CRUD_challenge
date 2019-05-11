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
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        
        // let navigation = UINavigationController()
        navigationController?.navigationBar.isTranslucent = false
        
        let addNew = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(moveToAddNewItemScreen))
        
        navigationItem.rightBarButtonItem = addNew
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
  
    @objc func moveToAddNewItemScreen() {
        show(AddNewItemViewController(), sender: self)
    }
}

