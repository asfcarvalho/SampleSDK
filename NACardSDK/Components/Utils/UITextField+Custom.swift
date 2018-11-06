//
//  UITextField+Custom.swift
//  NACardSDK
//
//  Created by Marcelo Dias on 06/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func getString(fromHtml html: String) {
        self.attributedText = html.htmlToAttributedString
    }
}
