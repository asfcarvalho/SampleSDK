//
//  CancelOptionsTableViewCell.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit

class CancelOptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonOk: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}