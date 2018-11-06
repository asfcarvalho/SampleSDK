//
//  VimeoPresenter.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 12/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation
import UIKit
import AVKit

public class VimeoPresenter: NSObject {
    
    func callVideo(url: String, key: String, viewController: UIViewController){
        if url.lowercased().contains("vimeo.com") {
            ServiceParamter.updateHeaderVimeo(key: key)
            if let id = url.split(separator: "/").last {
                getVimeoVideo(uri: String(id), callBack: { (response, message) in
                    if response != nil {
                        response?.download?.forEach({item in
                            if let height = item.height, height <= 360, let link = item.link {
                                self.showVideo(url: link, viewController: viewController)
                            }
                        })
                    }else {
                        self.showVideo(url: url, viewController: viewController)
                    }
                })
            }else {
                showVideo(url: url, viewController: viewController)
            }
        }else {
            showVideo(url: url, viewController: viewController)
        }
    }
    
    private func showVideo(url: String, viewController: UIViewController) {
        if let mURL = URL(string: url) {
            let playerViewController = AVPlayerViewController()
            let player = AVPlayer(url: mURL)
            playerViewController.player = player
            
            viewController.present(playerViewController, animated: true, completion: nil)
            
            
            
        }
    }
    
    
    //MARK: mostra video vimeo
    func getVimeoVideo(uri: String, callBack: @escaping (VimeoResponse?, String?) -> Void) {
        
        GetVimeoFetch(uri: uri).get(success: { (object, message) in
            if let result = object as? [String: Any] {
                if let resultVimeo = VimeoResponse(JSON: result) {
                    if resultVimeo.error == nil {
                        callBack(resultVimeo, nil)
                    }else{
                        callBack(nil, resultVimeo.error)
                    }
                }else{
                    callBack(nil, "Erro ao listar card")
                }
            }else{
                callBack(nil, "Erro ao listar card")
            }
        }) { (object, message) in
            callBack(nil, message ?? "Erro ao esconder card")
        }
    }
}
