//
//  UILable+Custom.swift
//  TesteRequest
//
//  Created by Marcelo Dias on 06/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func htmlToAttributedString(html: String, fontName: String) -> NSMutableAttributedString {
        guard let data = html.data(using: .utf8) else { return NSMutableAttributedString() }
        do {
            let mutable = try NSMutableAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            let range = NSRange(location: 0, length: mutable.length)
            print(self.font.fontDescriptor)
            mutable.addAttribute(.font, value: UIFont(descriptor: UIFontDescriptor(name: fontName, size: self.font.pointSize), size: self.font.pointSize), range: range)
//            mutable.addAttribute(.font, value: UIFont(descriptor: self.font.fontDescriptor, size: self.font.pointSize), range: range)
            mutable.addAttribute(NSAttributedStringKey.foregroundColor, value: self.textColor, range: range)
            return mutable
        } catch {
            return NSMutableAttributedString()
        }
    }
    
    func getString(fromHtml html: String, fontName: String?) {
//        print(self.font.fontDescriptor)
//        self.attributedText = try? NSMutableAttributedString(htmlString: html, font: self.font)
        
        self.attributedText = htmlToAttributedString(html: html, fontName: fontName ?? (self.font.fontDescriptor.object(forKey: UIFontDescriptor.AttributeName.name) as! String))
    }
}
