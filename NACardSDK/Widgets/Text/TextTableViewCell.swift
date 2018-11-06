//
//  TextTableViewCell.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit

class TextTableViewCell: BaseViewController {

    static let nib = UINib(nibName: "TextTableViewCell", bundle: Bundle(for: TextTableViewCell.self))
    static let cellIdentifier = "text"
    
    @IBOutlet weak var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    init() {
        super.init(nibName: "TextTableViewCell", bundle: Bundle(for: TextTableViewCell.self))
        self.view.backgroundColor = self.cardBackgroundColor()
        self.lblText.textColor = self.textColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setupCell(metadata: Metadata?) {
        self.lblText.getString(fromHtml: metadata?.text ?? "", fontName: NATableViewManager().textFont)
        self.lblText.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
}
