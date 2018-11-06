//
//  UIFont+Custom.swift
//  TesteRequest
//
//  Created by Marcelo Dias on 13/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import UIKit

extension UIFont {
    
    // load framework font in application
    class func loadAllFonts(bundleIdentifierString: Swift.AnyClass) {
        registerFontWithFilenameString(filenameString: "asfcarvalhoSans-Bold.otf", bundleIdentifierString: bundleIdentifierString)
        registerFontWithFilenameString(filenameString: "asfcarvalhoSans-Regular.otf", bundleIdentifierString: bundleIdentifierString)
        registerFontWithFilenameString(filenameString: "asfcarvalhoSans-Light.otf", bundleIdentifierString: bundleIdentifierString)
        registerFontWithFilenameString(filenameString: "asfcarvalhoScript.otf", bundleIdentifierString: bundleIdentifierString)
    }
    
    //MARK: - Make custom font bundle register to framework
    static func registerFontWithFilenameString(filenameString: String, bundleIdentifierString: Swift.AnyClass) {
        
        let frameworkBundle = Bundle(for: bundleIdentifierString)             
        let pathForResourceString = frameworkBundle.path(forResource: filenameString, ofType: nil)
        
        guard let fontData = NSData(contentsOfFile: pathForResourceString ?? "") else {
            print("Failed to register font - \(filenameString) not found.")
            return
        }
        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("Failed to register font - \(filenameString) not found.")
            return
        }
        
        let fontRef = CGFont(dataProvider)
        var errorRef: Unmanaged<CFError>? = nil
        
        if fontRef != nil {
            if (CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false) {
                print("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
            }
        }
    }
    
}
