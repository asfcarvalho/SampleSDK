//
//  UIImage+Custom.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 05/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {
    
    func loadImage(byURL url: String?) {
        if let url = url,  let data = URL(string: url) {
            try? self.image = UIImage(data: Data(contentsOf: data))
        }
    }
    
    func downloaded(fromURL url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        var activityIndicator: UIActivityIndicatorView?
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        showLoading(activityIndicator: activityIndicator ?? UIActivityIndicatorView())
        
        let request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    DispatchQueue.main.async() {
                        self.stopLoading(activityIndicator: &activityIndicator)
                    }
                    return }
            DispatchQueue.main.async() {
                self.stopLoading(activityIndicator: &activityIndicator)
                self.image = image
            }
            }.resume()
    }
    
    func downloaded(fromLink link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(fromURL: url, contentMode: mode)
    }
    
    func showLoading(activityIndicator: UIActivityIndicatorView) {
        
        
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        DispatchQueue.main.async {
            self.addSubview(activityIndicator)
            self.addConstraint(NSLayoutConstraint(item: activityIndicator,
                                                  attribute: NSLayoutAttribute.centerX,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: self,
                                                  attribute: NSLayoutAttribute.centerX,
                                                  multiplier: 1.0,
                                                  constant: 0.0))
            
            self.addConstraint(NSLayoutConstraint(item: activityIndicator,
                                                  attribute: NSLayoutAttribute.centerY,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: self,
                                                  attribute: NSLayoutAttribute.centerY,
                                                  multiplier: 1.0,
                                                  constant: 0.0))
        }
        
        DispatchQueue.main.async {
            activityIndicator.startAnimating()
        }
    }
    
    func stopLoading(activityIndicator: inout UIActivityIndicatorView?) {
        activityIndicator?.removeFromSuperview()
        activityIndicator = nil
    }
}
