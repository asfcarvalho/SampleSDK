//
//  NATableViewControllerPresenter.swift
//  TesteRequest
//
//  Created by Anderson Carvalho on 10/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol NATableViewControllerDelegate: class {
    @objc optional func selectRow(card: Card?)
    @objc optional func onLoading()
    @objc optional func onFinishLoading()
}

@objc public protocol NATableViewControllerDataSource {
    @objc func viewController() -> UIViewController
}

public class NATableViewControllerPresenter: MainPresenter {
    //MARK: busca todos os cards ou detalhe
    func listCards(byUserId userId: String, callBack: @escaping (CardResponse?, String?) -> Void) {
        ServiceParamter.updateHeader(userId: userId)
        GetCardsFetch().get(success: { (object, message) in
            if let result = object as? [String: Any] {
                if let resultCards = CardResponse(JSON: result) {
                    if resultCards.status?.success == true {
                        callBack(resultCards, nil)
                    }else{
                        callBack(nil, resultCards.status?.message)
                    }
                }else{
                    callBack(nil, "Erro ao listar cards")
                }
            }else{
                callBack(nil, "Erro ao listar cards")
            }
        }) { (object, message) in
            callBack(nil, message ?? "Erro ao listar cards")
        }
    }
}
