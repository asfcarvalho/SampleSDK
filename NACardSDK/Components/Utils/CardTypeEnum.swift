//
//  CardTypeEnum.swift
//  TesteRequest
//
//  Created by Anderson Carvalho on 04/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation


@objc public enum CardTypeEnum: Int {
    case Header
    case Text
    case Video
    case Button
    case Carrosel
    case Image
    case Title
    
    func type() -> String {
        switch self {
            case .Header: return "HEADER"
            case .Text: return "TEXT"
            case .Video: return "VIDEO"
            case .Button: return "BUTTON"
            case .Carrosel: return "CAROUSEL"
            case .Image: return "IMAGE"
            case .Title: return "TITLE"
        }
        
    }
    
    
    
}
