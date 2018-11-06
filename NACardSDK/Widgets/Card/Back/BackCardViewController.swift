//
//  BackCardViewController.swift
//  NACardSDK
//
//  Created by Ruan Gustavo on 10/09/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class BackCardViewController: UIViewController {

    var card: Card?
    var presenter: HeaderWidgetPresenter?
    var alert: UIAlertController?
    public var dataSource: HeaderTableViewDataSource?
    public var delegate: HeaderTableViewDelegate?
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelInfo: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var borderTitleView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = HeaderWidgetPresenter()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 11.0, *) {
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                titleView.topAnchor.constraintEqualToSystemSpacingBelow(guide.bottomAnchor, multiplier: 1.0),
                guide.bottomAnchor.constraintEqualToSystemSpacingBelow(titleView.topAnchor, multiplier: 1.0)
                ])
        }else {
            topConstraint.constant = 20
        }
        
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let metadata = self.card?.metadata?.first(where: {$0.type == CardTypeEnum.Header.type()})
        if let mMetadata = metadata {
            self.labelTitle.getString(fromHtml: mMetadata.title ?? "", fontName: NATableViewManager().titleFont)
            self.labelInfo.getString(fromHtml: mMetadata.text ?? "", fontName: NATableViewManager().titleFont)
        }
        
        //Setup card
        self.presenter?.cardPresenter.setupCard(card: self.card, stackView: self.stackView, headerDelegate: nil, delegate: nil, dataSource: nil, showHeader: false, isBack: true)
        //Setup Menu
        self.alert = self.presenter?.initMenu(metadata: metadata, btnMenu: menuButton, delegate: self.delegate, cardId: self.dataSource?.getIdCard())
        
        //Setup icon images
        let bundle = Bundle(for: HeaderTableViewCell.self)
        guard let image = UIImage(named: "menu_icon", in: bundle, compatibleWith: nil) else {
            fatalError("Missing menu_icon...")
            return
        }
        menuButton.setImage(image, for: .normal)
        
        guard let imageBack = UIImage(named: "back", in: bundle, compatibleWith: nil) else {
            fatalError("Missing back...")
            return
        }
        backButton.setImage(imageBack, for: .normal)
    }
    
    @IBAction func _tappedBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func _tappedMenuButton(_ sender: Any) {
        if let mAlert = self.alert {
            self.present(mAlert, animated: true, completion: nil)
        }
    }
}

@available(iOS 10.0, *)
extension BackCardViewController {
    public static func viewController() -> BackCardViewController {
        return BackCardViewController(nibName: "BackCardViewController", bundle: Bundle(for: BackCardViewController.self))
    }
    
    func setupView(card: Card?) {
        self.card = card
    }
}

//MARK: Card DataSource
@available(iOS 10.0, *)
extension BackCardViewController: HeaderTableViewDataSource {
    func getIdCard() -> String? {
        return self.dataSource?.getIdCard()
    }
    
    func viewController() -> UIViewController? {
        return self.dataSource?.viewController()
    }
}

//extension BackCardViewController: Cardtad
