//
//  ButtonTableViewCell.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit

class ButtonTableViewCell: BaseViewController {

    static let nib = UINib(nibName: "ButtonTableViewCell", bundle: Bundle(for: ButtonTableViewCell.self))
    static let cellIdentifier = "button"
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
        super.init(nibName: "ButtonTableViewCell", bundle: Bundle(for: ButtonTableViewCell.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setupCell(metadata: Metadata?) {
        button.setTitle(metadata?.title, for: .normal)
    }
    
}
