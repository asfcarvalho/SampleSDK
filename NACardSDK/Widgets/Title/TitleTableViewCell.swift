//
//  TitleTableViewCell.swift
//  NACardSDK
//
//  Created by Marcelo Dias on 06/09/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit

class TitleTableViewCell: BaseViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var viewBase: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    init() {
        super.init(nibName: "TitleTableViewCell", bundle: Bundle(for: TitleTableViewCell.self))
        
        self.viewBase.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.viewBase.backgroundColor = self.cardBackgroundColor()
        lblTitle.textColor = self.textColor()
        lblInfo.textColor = self.textColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setupCell(metadata: Metadata?) {
        self.lblTitle.getString(fromHtml: metadata?.title ?? "", fontName: NATableViewManager().titleFont)
        self.lblInfo.getString(fromHtml: metadata?.text ?? "", fontName: NATableViewManager().titleFont)
        
    }
    
}
