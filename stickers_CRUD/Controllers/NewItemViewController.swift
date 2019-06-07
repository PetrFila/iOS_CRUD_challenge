//
//  NewItemViewController.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 9/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class AddNewItemViewController: UIViewController {
    
    lazy var titleNameInput: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 4
        field.font = UIFont.systemFont(ofSize: 14)
        field.backgroundColor = UIColor.white
        field.placeholder = "Title"
        return field
    }()
    
    lazy var descripInput: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 4
        field.font = UIFont.systemFont(ofSize: 14)
        field.backgroundColor = UIColor.white
        field.placeholder = "Description"
        return field
        
    }()
    
    lazy var ratingNumberInput: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 4
        field.font = UIFont.systemFont(ofSize: 14)
        field.backgroundColor = UIColor.white
        field.placeholder = "Rating"
        return field
        
    }()
    
    lazy var urlImageViewInput: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 4
        field.font = UIFont.systemFont(ofSize: 14)
        field.backgroundColor = UIColor.white
        field.placeholder = "Paste picture URL"
        return field
        
    }()
    
    lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleNameInput, descripInput, ratingNumberInput, urlImageViewInput])
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.spacing = 40
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "New"

        let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveData))
        
        navigationItem.rightBarButtonItem = saveButton
        view.backgroundColor = UIColor.gray
        
        view.addSubview(titleNameInput)
        view.addSubview(descripInput)
        view.addSubview(ratingNumberInput)
        view.addSubview(urlImageViewInput)
        view.addSubview(stackView)
        
        translateAutoresizingConstraints()
        setConstraints()
    }
    
    func translateAutoresizingConstraints() {
        view.translateAutoresizingConstraintsToElements(view: titleNameInput)
        view.translateAutoresizingConstraintsToElements(view: descripInput)
        view.translateAutoresizingConstraintsToElements(view: ratingNumberInput)
        view.translateAutoresizingConstraintsToElements(view: urlImageViewInput)
        view.translateAutoresizingConstraintsToElements(view: stackView)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            titleNameInput.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleNameInput.heightAnchor.constraint(equalToConstant: 35)
        ])

        NSLayoutConstraint.activate([
            descripInput.heightAnchor.constraint(equalToConstant: 35)
        ])

        NSLayoutConstraint.activate([
            ratingNumberInput.heightAnchor.constraint(equalToConstant: 35)
        ])

        NSLayoutConstraint.activate([
            urlImageViewInput.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    @ objc func saveData(){
        
        

        guard let title = titleNameInput.text else {
            print("No title. This field is required")
            return
        }
        
        guard let description = descripInput.text else {
            print("No description. This field is required")
            return
        }
        
        guard let rating = Int(ratingNumberInput.text!) else {
            print("No rating. This field is required")
            return
        }
        
        guard let url = urlImageViewInput.text else {
            print("No link. This field is required")
            return
        }
        
        let modelWithData = StickerModel(title: title, description: description, rating: rating, url: url)

     
        
        
        
        let apiCall = APICallClass()
        apiCall.saveData(modelWithData) { (modelWithData, Error) in
            print("Data saved")
        }
        
        
        
        
        

    }
}

