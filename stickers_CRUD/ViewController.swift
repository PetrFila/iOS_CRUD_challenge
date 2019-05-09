//
//  ViewController.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 9/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
//        let navigation = UINavigationController()
        navigationController?.navigationBar.isTranslucent = false
        
        let addNew = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(moveToAddNewItemScreen))
        
        navigationItem.rightBarButtonItem = addNew
    }

    @objc func moveToAddNewItemScreen() {
        show(AddNewItemViewController(), sender: self)
    }
}

