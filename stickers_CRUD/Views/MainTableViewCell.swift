//
//  TableViewCell.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 11/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var title: String?
    var desc: String?
    var rating: Int?
    var url: URL?
    
    lazy var titleName: UILabel = {
        var text = UILabel()
//        text.lineBreakMode = .byWordWrapping
//        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    lazy var descrip: UILabel = {
        var textView = UILabel()
        textView.isUserInteractionEnabled = false
        textView.numberOfLines = 0
        textView.lineBreakMode = .byWordWrapping
        return textView
    }()
    
    lazy var ratingNumber: UILabel = {
        var textView = UILabel()
        return textView
    }()
    
    lazy var urlImage: UILabel = {
        var image = UILabel()
        return image
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(titleName)
        self.addSubview(descrip)
        self.addSubview(ratingNumber)
        self.addSubview(urlImage)
        
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let title = title {
            titleName.text = title
        }
        
//        titleName.text = "TEST"

        
        if let desc = desc {
            descrip.text = desc
        }
        
        
        if let rating = rating {
            ratingNumber.text = String(rating)
        }
        
//        if let url = url {
//            urlImage.text = url
//        }
    }
    
    
    func setConstraints() {
       
//        titleName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        
//        NSLayoutConstraint.activate([
//            titleName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            titleName.centerYAnchor.constraint(equalTo: self.centerYAnchor)

//            titleName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
//            titleName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
//            titleName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
//            titleName.heightAnchor.constraint(equalToConstant: 40)
//            ])
        
        
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
