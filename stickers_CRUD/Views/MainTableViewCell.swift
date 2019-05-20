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
//    var description: String?
    var rating: Int?
    var url: URL?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
