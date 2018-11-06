//
//  ImageLoadingFetch.swift
//  TesteRequest
//
//  Created by Anderson Carvalho on 13/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation

class ImageLoadingFetch: GetRequest {
    
    init(uri: String) {
        super.init(endpoint: uri)
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
