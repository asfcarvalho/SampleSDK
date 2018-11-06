//
//  NATableViewManager.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 05/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation
import UIKit

/// External class
open class NATableViewManager: NSObject {
    
    public override init() {
        super.init()
    }
    
    // MARK: - Variables
    ///
    // MARK: Background
    /// Used to change backgroundColor of card
    /// The color **white** is defined by default
    @objc open var cardBackgroundColor: UIColor?
    // MARK: Buttons
    /// Used to change backgroundColor of Button
    @objc open var buttonBackgroundColor: UIColor?
    /// Used to change color of text in Button
    /// The color **white** is defined by default
    @objc open var textButtonColor: UIColor?
    // MARK: Text
    /// Used to change all colors of all text
    /// The color **black** is defined by default
    @objc open var textColor: UIColor?
    // MARK: blacklist
    /// 
    open var cardBlacklist: [CardTypeEnum]?
    // MARK: Fonts
    ///
    open var titleFont: String?
    ///
    open var subtitleFont: String?
    ///
    open var textFont: String?
    
    // MARK: Load all fonts
    ///
    /// Use this to registry all fonts required in `NACardSDK`
    @objc open func loadAllFonts() {
        UIFont.loadAllFonts(bundleIdentifierString: NATableViewManager.self)
    }
    
    // MARK: Used in Objective-c
    ///
    /// Use this to set the Black list of card
    ///
    /// - parameter list: The list of `CardTypeEnum`
    @objc open func set(cardBackList: [Int]) {
        var list = [CardTypeEnum]()
        
        for item in cardBackList {
            if let value = type(byIndex: item) {
                list.append(value)
            }
        }
    }
    
    // Get the CardTypeEnum by index
    func type(byIndex: Int) -> CardTypeEnum? {
        switch byIndex {
        case 0: return .Header
        case 1: return .Text
        case 2: return .Video
        case 3: return .Button
        case 4: return .Carrosel
        case 5: return .Image
        case 6: return .Title
        default:
            return nil
        }
        
    }
}
