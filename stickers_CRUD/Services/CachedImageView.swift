//
//  IMGCallClass.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 25/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class CachedImageView: UIImageView {
    
    let imageCache = NSCache<NSString, UIImage>()
    var emptyImage = UIImage()
    var shouldUseEmptyImage = true


    
    func loadImage(urlString: String) {

    
       
        
        // checks for cache first. if the image is already there, no URL fetch happens
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache as UIImage
        }
        
        // if urlString is nil then empty image will be used
        guard let url = URL(string: urlString) else {
            print("No URL")
            return 
        }
    
        
        // gets the url from the string and fetches the image
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
       
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

