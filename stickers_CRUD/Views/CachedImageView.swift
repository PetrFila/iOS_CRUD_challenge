//
//  IMGCallClass.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 25/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class CachedImageView: UIImageView {
    var unwrappedURL: URL
    
    // creating Cache onject with key as the URL link as string and the image itself
    let imageCache = NSCache<NSString, UIImage>()
    var emptyImage = UIImage()
    var shouldUseEmptyImage = true
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    init(unwrappedURL: URL) {
//        self.unwrappedURL = unwrappedURL
//    }
    
    
    func loadImage(urlFromAPI: String) {

        // checks for cache first. if the image is already there, no URL fetch happens
        if let imageFromCache = imageCache.object(forKey: urlFromAPI as NSString) {
            self.image = imageFromCache as UIImage
        }
        
        // if urlFromAPI is nil then empty image will be used
        let urlFromAPI = URL(string: urlFromAPI)
//        let checkURL = urlCheck(url: urlFromAPI)
        
        do {
            try urlCheck(url: urlFromAPI)
            if let url = urlFromAPI {
                unwrappedURL = url
            }
            // If we reach this point in the code, then it means
            // that no error was thrown, and the validation passed.
            
        } catch {
            // The variable ‘error’ is automatically available
            // inside of ‘catch’ blocks.
            print(error)
        }
        
        
        
        
        
        
        
//        if checkURL.1 != nil {
//            print(checkURL.1!)
//
//            return
//        }

//        guard let url = URL(string: urlString) else {
//            print("No URL")
//            return
//        }
    
        
        // gets the url from the string and fetches the image
        URLSession.shared.dataTask(with: unwrappedURL, completionHandler: { (data, response, error) in
       
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let content = data else {
                print("No data found")
                
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: content)
            }
        }).resume()
        
    }
}

