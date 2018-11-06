//
//  ServiceParamter.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation

class ServiceParamter {
    
    static var url: String = "https://some-api.appspot.com"
    static var urlVimeo: String = "https://api.vimeo.com/me/videos/"
    static var header: Dictionary<String, String> = [:]
    static var headerVimeo: Dictionary<String, String> = [:]
    
    static func updateHeaderVimeo(key: String) {
        headerVimeo = ["Authorization":"Bearer " + key, "Cache-Control":"no-cache"]
        print(headerVimeo.description)
    }
    
    static func updateHeader(userId: String) {
        header = ["user_id":userId]
    }
}
