//
//  String+Custom.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 05/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation

extension String {
   
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
}
