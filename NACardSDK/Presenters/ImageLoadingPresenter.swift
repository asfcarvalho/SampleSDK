//
//  ImageLoadingPresenter.swift
//  TesteRequest
//
//  Created by Marcelo Dias on 13/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation

class ImageLoadingPresenter {
    
    //MARK: Esconde o card
    func gerImage(uri: String, callBack: @escaping (String?, String?) -> Void) {
        
        ImageLoadingFetch(uri: uri).get(success: { (response, message) in
            
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200
            
                else {
//                    DispatchQueue.main.async() {
//                        self.stopLoading(activityIndicator: &activityIndicator)
//                    }
                    return
                    
            }
            
//            let mimeType = response.mimeType
//            mimeType.hasPrefix("image")
//            let data = data, error == nil,
//            let image = UIImage(data: data)
//            self.stopLoading(activityIndicator: &activityIndicator)
//            self.image = image
            
            
            
//            if let result = object as? [String: Any] {
            
//                guard
//                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                    let data = data, error == nil,
//                    let image = UIImage(data: data)
//                    else {
//                        DispatchQueue.main.async() {
//                            self.stopLoading(activityIndicator: &activityIndicator)
//                        }
//                        return }
//                DispatchQueue.main.async() {
//                    self.stopLoading(activityIndicator: &activityIndicator)
//                    self.image = image
//                }
//            }.resume()
                
                
//                if let resultDismiss = DismissResponse(JSON: result) {
//                    if resultDismiss.baseStatus?.success == true {
//                        callBack(resultDismiss, nil)
//                    }else{
//                        callBack(nil, resultDismiss.baseStatus?.message)
//                    }
//                }else{
//                    callBack(nil, "Erro ao listar card")
//                }
//            }else{
//                callBack(nil, "Erro ao listar card")
//            }
        }) { (object, message) in
            callBack(nil, message ?? "Erro ao esconder card")
        }
    }
}
