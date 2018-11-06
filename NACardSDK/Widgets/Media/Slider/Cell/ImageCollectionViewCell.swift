//
//  ImageCollectionViewCell.swift
//  NACardSDK
//
//  Created by Ruan Gustavo on 30/08/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    static let nib = UINib(nibName: "ImageCollectionViewCell", bundle: Bundle(for: ImageCollectionViewCell.self))
    static let cellIdentifier = "cell"
    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    public func setupCell(url: String?) {
        self.imageView.downloaded(fromLink: url ?? "", contentMode: UIViewContentMode.scaleAspectFill)
    }
}
