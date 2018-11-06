//
//  BackCardViewControllerPresenter.swift
//  TesteRequest
//
//  Created by Anderson Carvalho on 12/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation
import  UIKit

protocol BackCardViewControllerDelegate {
    func dismiss(id: String)
    func share()
    func forward()
    func web(url: String)
}
