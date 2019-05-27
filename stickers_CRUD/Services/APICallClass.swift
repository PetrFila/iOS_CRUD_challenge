//
//  APICall.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 15/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class APICallClass {
    
    let session = URLSession.init(configuration: URLSessionConfiguration.default)
    let url = URL(string: "https://gentle-forest-97962.herokuapp.com/")
    
    func fetchData(completion: @escaping (_: [String:[StickerModel]]?, Error?) -> Void) {
        
        guard let urlCheck = url else {
            let urlError = NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey : "Empty URL"])
            completion(nil, urlError)
            return
        }
        
        _ = session.dataTask(with: urlCheck) { data, response, error in

            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let content = data else {
                print("No data")
                completion(nil, error)
                return
            }
            
            do {
                let jsonToModel = try JSONDecoder().decode([String:[StickerModel]].self, from: content)
                completion(jsonToModel, nil)
                
            } catch {
                completion(nil, error)
                
            }
            
            }.resume()
    }
}





