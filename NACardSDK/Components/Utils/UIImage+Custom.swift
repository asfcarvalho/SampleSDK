//
//  UIImage+Custom.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 14/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation

extension UIImage {
    convenience init?(inCurrentBundleNamed: String) {
        class BundleClass { }
        self.init(named: inCurrentBundleNamed, in: Bundle(for: BundleClass.self), compatibleWith: nil)
    }
}
