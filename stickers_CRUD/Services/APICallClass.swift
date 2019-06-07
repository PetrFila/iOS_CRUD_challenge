//
//  APICall.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 15/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class APICallClass {
    
    
    // MARK:- GET all items
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
    
    
    // MARK:- POST new item
    
//    var test = StickerModel(title: "test", description: "testing encoding", rating: 1, url: "some url")
    // Need to get the data from the input in the model first under some variable
    // which will be used as an argument for the saveData function and encode method
    
    func saveData(_ modelWithData: StickerModel?, completion: @escaping (_ modelWithData: StickerModel?, Error?) -> Void) {
        guard let urlCheck = url else {
            let urlError = NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey : "Empty URL"])
            completion(nil, urlError)
            return
        }
        print("From saveData", modelWithData?.title! as Any)
        
        do {
            var urlRequest = URLRequest(url: urlCheck)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(modelWithData)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(nil, NSError() as Error)
                    return
                }
                
                do {
                    let messageData = try JSONDecoder().decode(StickerModel.self, from: jsonData)
                    completion(messageData, nil)
                }catch {
                    completion(nil,error)
                }
        }
        dataTask.resume()
            
            
        }catch{
            completion(nil,error)
        }
    }

    
    
    
}

