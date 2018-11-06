//
//  GetVimeoFetch.swift
//  NACardSDK
//
//  Created by Marcelo Dias on 12/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation

class GetVimeoFetch: GetRequest {
    
    init(uri: String) {
        super.init(url: ServiceParamter.urlVimeo, endpoint: uri, headers: ServiceParamter.headerVimeo)
    }
    
    func get(success: anyObjectResponse?, failure: defaultResponse? = nil) {
        super.get().responseJSON { request in
            if request.result.isSuccess {
                success?(request.result.value, "Video carregado com sucesso")
            }else{
                failure?("Erro", "Erro ao carregar video")
            }
        }
    }
}
