//
//  BaseTableViewCell.swift
//  TesteRequest
//
//  Created by Marcelo Dias on 06/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialization code
    }
    
    //MARK: get manager configurations
    func cardBackgroundColor() -> UIColor {
        if let backgroundColor = NATableViewManager().cardBackgroundColor {
            return backgroundColor
        }
        return UIColor.white
    }
    
    func textColor() -> UIColor {
        if let textColor = NATableViewManager().textColor {
            return textColor
        }
        
        return UIColor.black
    }

}
