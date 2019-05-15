//
//  NewItemViewController.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 9/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class AddNewItemViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New"

        let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveData))
        
        navigationItem.rightBarButtonItem = saveButton
        view.backgroundColor = UIColor.gray
    }
    
    @ objc func saveData(){
        print("Data saved")
    }
}
