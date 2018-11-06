//
//  HeaderActionsEnum.swift
//  NACardSDK
//
//  Created by Ruan Gustavo on 06/09/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation

public enum HeaderActionsEnum: String {
    case Dismiss = "dismiss"
    case Share = "share"
    case Forward = "forward"
    case Web = "web"
    
    func type() -> String {
        return self.rawValue
    }
    
    static func isDismiss(value: String) -> Bool {
        return value.lowercased() == HeaderActionsEnum.Dismiss.rawValue.lowercased()
    }
    static func isShare(value: String) -> Bool {
        return value.lowercased() == HeaderActionsEnum.Share.rawValue.lowercased()
    }
    static func isForward(value: String) -> Bool {
        return value.lowercased() == HeaderActionsEnum.Forward.rawValue.lowercased()
    }
    static func isWeb(value: String) -> Bool {
        return value.lowercased() == HeaderActionsEnum.Web.rawValue.lowercased()
    }
}
