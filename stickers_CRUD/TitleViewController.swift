//
//  DetailsViewController.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 9/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Titel"
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveData))
        
        navigationItem.rightBarButtonItem = saveButton

        view.backgroundColor = UIColor.blue
    }
    
    @ objc func saveData(){
        print("Data saved")
    }
    
    
}
