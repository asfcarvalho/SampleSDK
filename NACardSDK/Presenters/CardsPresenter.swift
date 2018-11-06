//
//  CardsPresenter.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation
import UIKit

protocol CardTableViewDataSource {
    func viewController() -> UIViewController?
}

@available(iOS 10.0, *)
public class CardsPresenter: MainPresenter {
    
    
    
    //MARK: Esconde o card
    func dissmisCard(uri: String, callBack: @escaping (DismissResponse?, String?) -> Void) {
        PutCardFetch(uri: uri).put(success: { (object, message) in
            if let result = object as? [String: Any] {
                if let resultDismiss = DismissResponse(JSON: result) {
                    if resultDismiss.baseStatus?.success == true {
                        callBack(resultDismiss, nil)
                    }else{
                        callBack(nil, resultDismiss.baseStatus?.message)
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
    
    func webBrowser(url: URL) {
        UIApplication.shared.open(url)
    }
    
    // MARK: - Take Card's Screenshot
    func imageCard(contentView: UIView) -> UIImage? {
//        hideButtons(contentView, isHidden: true)
        UIGraphicsBeginImageContext(contentView.bounds.size)
        let context = UIGraphicsGetCurrentContext()
        if let aContext = context {
            contentView.layer.render(in: aContext)
        }
        let screenShot: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
//        hideButtons(contentView, isHidden: false)
        
        return screenShot
    }
    
    //MARK: Share on External App
    func share(viewController: UIViewController, image: UIImage?, cardId: String) {
        let activityItems = [image]
        let activityViewControntroller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityViewControntroller.excludedActivityTypes = []
        if UI_USER_INTERFACE_IDIOM() == .pad {
            activityViewControntroller.popoverPresentationController?.sourceView = viewController.view
            activityViewControntroller.popoverPresentationController?.sourceRect = CGRect(x: viewController.view.bounds.size.width / 2, y: viewController.view.bounds.size.height / 4, width: 0, height: 0)
        }
        
        activityViewControntroller.completionWithItemsHandler = { activityType, completed, returnedItems, activityError in
            // If need, implement Analytics here!!
        }
        
        viewController.present(activityViewControntroller, animated: true)
    }
    
    func initTimerBanner(withTime time: Double, timer: inout Timer, block: @escaping (Timer) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: time, repeats: true, block: block)
    }
    
    func stopTimerBanner(timer: inout Timer) {
        timer.invalidate()
    }
    
    //MARL: setup card
    func setupCard(card: Card?, stackView: UIStackView, headerDelegate: HeaderTableViewCellDelegate?, delegate: HeaderTableViewDelegate? = nil, dataSource: HeaderTableViewDataSource? = nil, showHeader: Bool = true, isBack: Bool = false) {
        
        for stack in stackView.arrangedSubviews {
            stack.removeFromSuperview()
        }
        
        if let listMetadata = card?.metadata {
            for metadata in listMetadata {
                if showHeader, metadata.home == true, metadata.type == CardTypeEnum.Header.type() {
                    let header = HeaderTableViewCell(headerDelegate: headerDelegate)
                    stackView.addArrangedSubview(header.view)
                    header.setupCell(metadata: metadata, delegate: delegate, dataSource: dataSource)
                }
                
                if (metadata.home == true || isBack), metadata.type == CardTypeEnum.Text.type() {
                    let text = TextTableViewCell()
                    stackView.addArrangedSubview(text.view)
                    text.setupCell(metadata: metadata)
                }
                
                if (metadata.home == true || isBack), metadata.type == CardTypeEnum.Button.type() {
                    let button = ButtonTableViewCell()
                    stackView.addArrangedSubview(button.view)
                    button.setupCell(metadata: metadata)
                }
                
                if (metadata.home == true || isBack), metadata.type == CardTypeEnum.Carrosel.type() {
                    let carrousel = CarrouselTableViewCell()
                    stackView.addArrangedSubview(carrousel.view)
                    carrousel.setupCell(metadata: metadata)
                }
                
                if (metadata.home == true || isBack), metadata.type == CardTypeEnum.Image.type() {
                    let image = ImageTableViewCell()
                    stackView.addArrangedSubview(image.view)
                    image.setupCell(metadata: metadata)
                }
                
                if (metadata.home == true || isBack), metadata.type == CardTypeEnum.Title.type() {
                    let title = TitleTableViewCell()
                    stackView.addArrangedSubview(title.view)
                    title.setupCell(metadata: metadata)
                }
            }
        }
    }
}

