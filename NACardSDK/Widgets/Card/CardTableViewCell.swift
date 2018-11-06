//
//  CardTableViewCell.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 30/08/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit
import AVKit


@available(iOS 10.0, *)
class CardTableViewCell: UITableViewCell {

    var card: Card?
    var height: CGFloat = 0
    var presenter: CardsPresenter?
    var indexPath: IndexPath?
    
    static let nib = UINib(nibName: "CardTableViewCell", bundle: Bundle(for: CardTableViewCell.self))
    static let cellIdentifier = "cell"
    
    var dataSource: CardTableViewDataSource?
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var viewBorder: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        presenter = CardsPresenter()
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected, let listMetadata = card?.metadata {
            print("selected card" + (self.dataSource?.viewController()?.description ?? ""))
            if let metadata = listMetadata.first(where: { $0.type == CardTypeEnum.Video.type() }) {
//                if let url = metadata.url, let vc = self.dataSource?.viewController() {
//                    VimeoPresenter().callVideo(url: url, key: "54297700083ad63acde0a49ef240e81c", viewController: vc)
//                }
//            }else {
                let vc = BackCardViewController.viewController()
                vc.dataSource = self
                vc.delegate = self
                vc.setupView(card: self.card)
                self.dataSource?.viewController()?.present(vc, animated: true, completion: nil)
                
            }
        }
        // Configure the view for the selected state
    }
    
    //MARK: Config cell
    private func setupCell() {
        //border
        self.viewBorder.clipsToBounds = true
        self.viewBorder.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        self.viewBorder.layer.borderWidth = 1
        self.viewBorder.layer.cornerRadius = 6
    }
    
    //MARK: Show all components
    func setupTable(card: Card?, indexPath: IndexPath) {
        self.card = card
        
        self.indexPath = indexPath
        
        self.presenter?.setupCard(card: card, stackView: self.stackView, headerDelegate: self, delegate: self, dataSource: self)
    }
}

//MARK: HeaderDelegate
@available(iOS 10.0, *)
extension CardTableViewCell: HeaderTableViewDelegate {
    
    func web(url: String) {
        guard let mUrl = URL(string: url) else { return }
        self.presenter?.webBrowser(url: mUrl)
    }
    
    func dismiss(id: String) {
        presenter?.dissmisCard(uri: id, callBack: {(response, message) in
            if let msg = message {
                print(msg)
            }
        })
    }
    
    func share() {
        let image = self.presenter?.imageCard(contentView: self.contentView)
        guard let cardId = self.card?.internalIdentifier, let vc = self.dataSource?.viewController() else {
            return
        }
        self.presenter?.share(viewController: vc, image: image, cardId: cardId)
    }
    
    func forward() {
        print("Forward")
    }
}

//MARK: HeaderDelegate
@available(iOS 10.0, *)
extension CardTableViewCell: HeaderTableViewDataSource {
    func viewController() -> UIViewController? {
        return self.dataSource?.viewController()
    }
    
    func getIdCard() -> String? {
        return self.card?.internalIdentifier
    }
}

@available(iOS 10.0, *)
extension CardTableViewCell: HeaderTableViewCellDelegate {
    func menuAction() {
        print("pressed")
    }
    
    
}

