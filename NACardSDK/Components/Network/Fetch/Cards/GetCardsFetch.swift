//
//  GetCardsFetch.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation

class GetCardsFetch: GetRequest {
    
    init() {
        super.init(endpoint: "/card/user")
    }
    
    func get(success: anyObjectResponse?, failure: defaultResponse? = nil) {
        super.get().responseJSON { request in
            if request.result.isSuccess {
                success?(request.result.value, "Cards listados com sucesso")
            }else{
                failure?("Erro", "Erro ao listar cards")
            }
        }
    }
}
