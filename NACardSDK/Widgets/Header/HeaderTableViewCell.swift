//
//  HeaderTableViewCell.swift
//  NACardSDK
//
//  Created by Ruan Gustavo on 30/08/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit

protocol HeaderTableViewCellDelegate {
    func menuAction()
}

@available(iOS 10.0, *)
class HeaderTableViewCell: BaseViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var btnMenu: UIButton!

    var alert: UIAlertController?
    var presenter: HeaderWidgetPresenter?
    var metadata: Metadata?
    
    public var dataSource: HeaderTableViewDataSource?
    public var delegate: HeaderTableViewDelegate?
    
    public var headerDelegate: HeaderTableViewCellDelegate?
    
    static let nib = UINib(nibName: "HeaderTableViewCell", bundle: Bundle(for: HeaderTableViewCell.self))
    static let cellIdentifier = "header"
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    init(headerDelegate: HeaderTableViewCellDelegate?) {
        super.init(nibName: "HeaderTableViewCell", bundle: Bundle(for: HeaderTableViewCell.self))
        self.view.backgroundColor = self.cardBackgroundColor()
        self.lblTitle.textColor = self.textColor()
        self.lblInfo.textColor = self.textColor()
        self.presenter = HeaderWidgetPresenter()
        self.headerDelegate = headerDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: Tapped Button Menu
    @IBAction func _tapedMenu(_ sender: Any) {
        if let vc = self.dataSource?.viewController(), let mAlert = self.alert {
            vc.present(mAlert, animated: true, completion: nil)
        }
    }
}

@available(iOS 10.0, *)
extension HeaderTableViewCell {
    //MARK: Setup Cell
    public func setupCell(metadata: Metadata?, delegate: HeaderTableViewDelegate?, dataSource: HeaderTableViewDataSource?) {
        self.delegate = delegate
        self.dataSource = dataSource
        self.metadata = metadata
        
        //Setup icon images
        let bundle = Bundle(for: HeaderTableViewCell.self)
        guard let image = UIImage(named: "menu_icon", in: bundle, compatibleWith: nil) else {
            fatalError("Missing menu_icon...")
        }
        btnMenu.setImage(image, for: .normal)
        
        setupCell(metadata: metadata)
    }
    
    //MARK: Simple Setup Cell
    public func setupCell(metadata: Metadata?) {
        if let mMetadata = metadata, let acts = mMetadata.actions, acts.count > 0 {
            self.setupMenu(metadata: mMetadata)
        }else {
            self.deleteMenu()
        }

        
        self.imageIcon.downloaded(fromLink: metadata?.icon ?? "")
        self.lblTitle.getString(fromHtml: metadata?.title ?? "", fontName: NATableViewManager().titleFont)
        self.lblInfo.getString(fromHtml: metadata?.category ?? "", fontName: NATableViewManager().titleFont)
    
        self.lblTitle.sizeToFit()
        self.lblInfo.sizeToFit()
        
        self.mainView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    //MARK: Delete Menu
    private func deleteMenu() {
        self.alert = nil
        self.btnMenu.isHidden = true
    }
    
    //MARK: Setup Menu
    private func setupMenu(metadata: Metadata) {
        self.btnMenu.isHidden = false
        self.alert = UIAlertController(title: "Options", message: "Choose a option!", preferredStyle: .actionSheet)
        let actions = metadata.actions

        actions?.forEach({
            let action = $0
            self.alert?.addAction(UIAlertAction(title: action.tEXT, style: .default, handler: { act in
                if let type = action.tYPE {
                    if HeaderActionsEnum.isDismiss(value: type) {
                        if let id = self.dataSource?.getIdCard() {
                            self.delegate?.dismiss(id: id)
                        }
                    }
                    if HeaderActionsEnum.isShare(value: type) {
                        self.delegate?.share()
                    }
                    if HeaderActionsEnum.isForward(value: type) {
                        self.delegate?.forward()
                    }
                    if HeaderActionsEnum.isWeb(value: type) {
                        if let url = action.link {
                            self.delegate?.web(url: url)
                        }
                    }
                }
            }))
        })
        self.alert?.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
    }
}

