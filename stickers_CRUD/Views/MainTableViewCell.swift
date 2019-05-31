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
    var urlString: String?
    var navArrowImage = UIImage(named: "icons8-back-96")
    
    lazy var titleName: UILabel = {
        var text = UILabel()
        text.font = UIFont.init(name: "Arial", size: 16)
        return text
    }()
    
    lazy var descrip: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.init(name: "Arial", size: 12)
        return textView
    }()
    
    lazy var ratingNumber: UILabel = {
        var textView = UILabel()
        textView.font = UIFont.init(name: "Arial", size: 12)
        return textView
    }()
    
    lazy var urlImageView: CachedImageView = {
        var image = CachedImageView()
        return image
    }()
    
    lazy var navArrowImageView: UIImageView = {
        var image = UIImageView()
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(titleName)
        self.addSubview(descrip)
        self.addSubview(ratingNumber)
        self.addSubview(urlImageView)
        self.addSubview(navArrowImageView)
        
        translateAutoresizingConstraints()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if let title = title {
            titleName.text = title
        }
 
        if let desc = desc {
            descrip.text = desc
        }
        
        if let rating = rating {
            ratingNumber.text = "Rating: " + String(rating)
        }
        
        if let navArrowImage = navArrowImage {
            navArrowImageView.image = navArrowImage
        }
        
        if let unwrapURLString = urlString {
            let urlToPass = unwrapURLString
            print(urlToPass)
            urlImageView.loadImage(urlString: urlToPass)
        }
    }
    
    func translateAutoresizingConstraints() {
        self.translateAutoresizingConstraintsToElements(view: titleName)
        self.translateAutoresizingConstraintsToElements(view: descrip)
        self.translateAutoresizingConstraintsToElements(view: ratingNumber)
        self.translateAutoresizingConstraintsToElements(view: urlImageView)
        self.translateAutoresizingConstraintsToElements(view: navArrowImageView)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            urlImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            urlImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            urlImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            urlImageView.heightAnchor.constraint(equalToConstant: 55),
            urlImageView.widthAnchor.constraint(equalToConstant: 55)
            ])

        NSLayoutConstraint.activate([
            titleName.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            titleName.leftAnchor.constraint(equalTo: urlImageView.rightAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            descrip.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 15),
            descrip.leftAnchor.constraint(equalTo: urlImageView.rightAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            ratingNumber.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ratingNumber.rightAnchor.constraint(equalTo: navArrowImageView.leftAnchor, constant: -20),
        ])
     
        NSLayoutConstraint.activate([
            navArrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            navArrowImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            navArrowImageView.heightAnchor.constraint(equalToConstant: 20),
            navArrowImageView.widthAnchor.constraint(equalToConstant: 20)
        ])        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

