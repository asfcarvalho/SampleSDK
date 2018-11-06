//
//  AVPlayer+Custom.swift
//  TesteRequest
//
//  Created by Marcelo Dias on 13/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation
import UIKit
import AVKit

extension CGAffineTransform {
    
    static let ninetyDegreeRotation = CGAffineTransform(rotationAngle: CGFloat(M_PI / 2))
}

extension AVPlayerViewController {
    
    var fullScreenAnimationDuration: TimeInterval {
        return 0.15
    }
    
    func minimizeToFrame(_ frame: CGRect) {
        UIView.animate(withDuration: fullScreenAnimationDuration) {
//            self.view.setAffineTransform(.identity)
            self.view.frame = frame
        }
    }
    
    func goFullscreen() {
        UIView.animate(withDuration: fullScreenAnimationDuration) {
//            self.view.setAffineTransform(.ninetyDegreeRotation)
            self.view.frame = UIScreen.main.bounds
        }
    }
}
