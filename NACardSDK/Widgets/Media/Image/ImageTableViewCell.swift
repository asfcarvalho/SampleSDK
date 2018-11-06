//
//  ImageTableViewCell.swift
//  NACardSDK
//
//  Created by Ruan Gustavo on 30/08/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit

class ImageTableViewCell: BaseViewController {

    static let nib = UINib(nibName: "ImageTableViewCell", bundle: Bundle(for: ImageTableViewCell.self))
    static let cellIdentifier = "image"
    
    @IBOutlet weak var mImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mImageView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    init() {
        super.init(nibName: "ImageTableViewCell", bundle: Bundle(for: ImageTableViewCell.self))
        self.view.backgroundColor = self.cardBackgroundColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    public func setupCell(metadata: Metadata?) {
        self.mImageView.downloaded(fromLink: metadata?.image ?? "", contentMode: UIViewContentMode.scaleAspectFill)
    }
    
}
