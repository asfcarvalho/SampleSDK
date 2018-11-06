//
//  HeaderWidgetPresenter.swift
//  NACardSDK
//
//  Created by Marcelo Dias on 06/09/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation
import UIKit

protocol HeaderTableViewDelegate {
    func dismiss(id: String)
    func share()
    func forward()
    func web(url: String)
}

protocol HeaderTableViewDataSource {
    func viewController() -> UIViewController?
    func getIdCard() -> String?
    
}

@available(iOS 10.0, *)
class HeaderWidgetPresenter {
    var cardPresenter: CardsPresenter = CardsPresenter()    
    var alert: UIAlertController?
    
    var delegate: HeaderTableViewDelegate?
    var cardId: String?
    
    func initMenu(metadata: Metadata?, btnMenu: UIButton, delegate: HeaderTableViewDelegate?, cardId: String?) -> UIAlertController? {
        self.delegate = delegate
        self.cardId = cardId
        if let mMetadata = metadata, let acts = mMetadata.actions, acts.count > 0 {
            self.setupMenu(metadata: mMetadata, btnMenu: btnMenu)
        }else {
            self.deleteMenu(btnMenu: btnMenu)
        }
        
        return self.alert
    }
    
    //MARK: Delete Menu
    func deleteMenu(btnMenu: UIButton) {
        alert = nil
        btnMenu.isHidden = true
    }
    
    //MARK: Setup Menu
    func setupMenu(metadata: Metadata, btnMenu: UIButton) {
        btnMenu.isHidden = false
        alert = UIAlertController(title: "Options", message: "Choose a option!", preferredStyle: .actionSheet)
        let actions = metadata.actions
        
        actions?.forEach({
            let action = $0
            alert?.addAction(UIAlertAction(title: action.tEXT, style: .default, handler: { act in
                if let type = action.tYPE {
                    if HeaderActionsEnum.isDismiss(value: type) {
                        if let id = self.cardId {
                            self.delegate?.dismiss(id: id)
                        }
                    }
                    if HeaderActionsEnum.isShare(value: type) {
                        self.delegate?.share()
                    }
                    if HeaderActionsEnum.isForward(value: type) {
                        self.delegate?.forward()
                    }
                    if HeaderActionsEnum.isWeb(value: type) {
                        if let url = action.link {
                            self.delegate?.web(url: url)
                        }
                    }
                }
            }))
        })
        alert?.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
    }
}
