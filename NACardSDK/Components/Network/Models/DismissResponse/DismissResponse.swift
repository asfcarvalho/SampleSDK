//
//  DismissResponse.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 03/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation
import ObjectMapper

public class DismissResponse: Mappable {
    
    var baseStatus: Status?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        baseStatus <- map["status"]
    }
}
