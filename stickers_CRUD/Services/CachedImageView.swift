//
//  IMGCallClass.swift
//  stickers_CRUD
//
//  Created by Petr Fila on 25/5/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class CachedImageView: UIImageView {
    
    let imageCache = NSCache<AnyObject, AnyObject>()
    var emptyImage = UIImage()
    var shouldUseEmptyImage = true


    
    func loadImage(urlString: String) {
//        DispatchQueue.main.async {
//            let imageToCache = UIImage(data: content)
//            print("Async image load", content)
//                            self.imageCache.setObject(imageToCache!, forKey: url as AnyObject)
//            self.image = UIImage(imageLiteralResourceName: "icons8-back-96")  //imageToCache
//        }
    
       
        
        // checks for cache first. if the image is already there, no URL fetch happens
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) {
            self.image = imageFromCache as? UIImage
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
//                print("Async image load", content)
//                self.imageCache.setObject(imageToCache!, forKey: url as AnyObject)
//                self.image = UIImage(imageLiteralResourceName: "icons8-back-96")  //imageToCache
            }
        }).resume()
        
    }
}


//func setImage(from url: URL, withPlaceholder placeholder: UIImage? = nil) {
//    self.image = placeholder
//    URLSession.shared.dataTask(with: url) { (data, _, _)
//        if let data = data {
//            let image = UIImage(data: data)
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//        }.resume()
//}
