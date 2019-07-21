//
//  urlCheck.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 9/6/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import Foundation
import UIKit


//    func urlCheck(url:URL?) -> (URL?, Error?) {
//        var _: (URL, Error)
//
//        guard let urlCheck = url else {
//            let urlError = APIError.decodingProblem
//            return (nil, urlError)
//        }
//        return (urlCheck, nil)
//    }


//func urlCheck(url:URL?) -> (URL?, Error?) {
//
//    guard let urlCheck = url else {
//        var _: (URL?, Error?)
//        let urlError = APIError.noURL.localizedDescription
//
//        return (nil, urlError)
//    }
//
//    return (urlCheck, nil)
//}

func urlCheck(url:URL?) throws {
    guard url == url else {
        throw APIError.noURL
    }
}
