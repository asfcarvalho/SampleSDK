//
//  PutRequest.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 03/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation
import Alamofire

class PutRequest: BaseRequest {
    
    func put() -> DataRequest{
        
        var request = URLRequest(url: URL(string: self.mainURL)!)
        request.httpMethod = "PUT"
        request.allHTTPHeaderFields = self.headers
        
        print("put headers: \(String(describing: self.headers))")
        
        return alamofireRequest(urlRequest: request)
    }
}
