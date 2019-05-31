//
//  StickerModel.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 17/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

struct StickerModel: Decodable {

    var id: Int
    var title: String?
    var description: String?
    var rating: Int?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case rating = "rating"
        case url = "url"
    }
}
