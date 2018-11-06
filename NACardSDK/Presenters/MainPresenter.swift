//
//  MainPresenter.swift
//  TesteRequest
//
//  Created by Marcelo Dias on 10/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation
import  UIKit

public class MainPresenter {
    //MARK: retorna a altura total da celula
    func getCellHeightTotal(card: Card?) -> CGFloat {
        
        var height: CGFloat = 0
        
        if let metadata = card?.metadata {
            for item in metadata {
                height += getCellHeight(type: (item.type ?? ""))
            }
        }
        
        return height
    }
    
    //MARK: retorna a altura das subcelula
    func getCellHeight(type: String) -> CGFloat {
        
//        if type == CardTypeEnum.Title.type() {
//            return 74
//        }else
        if type == CardTypeEnum.Video.type() ||
            type == CardTypeEnum.Carrosel.type() ||
            type == CardTypeEnum.Image.type() {
            return 194
        }else
            
            if type == CardTypeEnum.Button.type() {
            return 48
        }
        
        return 0
    }
}
