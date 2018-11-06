//
//  CarouselPresenter.swift
//  TesteRequest
//
//  Created by Marcelo Dias on 10/09/2018.
//  Copyright © 2018 Anderson Carvalho. All rights reserved.
//

import Foundation

@available(iOS 10.0, *)
class CarouselPresenter {
    
    public func startTimer(withTimeInterval time: Double, timer: inout Timer?, block: @escaping (Timer) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: time, repeats: true, block: block)
    }
    
    public func stopTimer(timer: inout Timer?) {
        timer?.invalidate()
        timer = nil
    }
}
