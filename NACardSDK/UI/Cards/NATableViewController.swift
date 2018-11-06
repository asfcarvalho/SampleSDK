//
//  TableViewController.swift
//  NACardSDK
//
//  Created by Anderson Carvalho on 03/09/2018.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import Foundation
import UIKit

/// External class
@available(iOS 10.0, *)
open class NATableViewController: UITableView {
    
    var presenter: NATableViewControllerPresenter?
    var listCard: CardResponse?
    var uri: String?
    var heightCell: CGFloat?
    var heightHeaderCell: CGFloat?
    /*!
        Objective-c
     */
    //MARK: External parameters
    ///
    @objc public var naDelegate: NATableViewControllerDelegate!
    ///
    @objc public var naDataSource: NATableViewControllerDataSource!
    
    //MARK: Init with presenter
    
    /// Init with frame and/or `UITableViewStyle`
    ///
    /// - parameter frame: The frame to set in `UITableView`
    /// - parameter style: The style to set in `UITAbleView`
    public override init(frame: CGRect, style: UITableViewStyle = .plain) {
        let frameTemp = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        super.init(frame: frameTemp, style: style)
        initSetup()
    }
    
    /// Init with aDecoder
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSetup()
    }
        
    func initSetup() {
                
        self.layoutIfNeeded()
        self.updateConstraintsIfNeeded()
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.separatorStyle = .none
        
        self.delegate = self
        self.dataSource = self
        
        presenter = NATableViewControllerPresenter()
        self.register(CardTableViewCell.nib, forCellReuseIdentifier: CardTableViewCell.cellIdentifier)
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 44
    }
    
    // MARK: - Show Cards
    
    /// Show the list of card `byUserID` and show in `UITableView`
    ///
    /// - parameter byUserID:        The User ID.
    /// - parameter handlerSucces:   `@escaping` Return if result is success
    /// - parameter handlerFailure:  `@escaping` Return if result is failure
    @objc public func showCards(byUserID userID: String, handlerSucces: @escaping (String?) -> Void, handlerFailure: @escaping (String?) -> Void) {

        
        self.naDelegate.onLoading?()
        
        self.presenter?.listCards(byUserId: userID, callBack: { (listCard, message) in
            if listCard != nil {
                self.listCard = listCard
                                
                self.reloadData()
                handlerSucces("SUCCESS")
                self.naDelegate.onFinishLoading?()
            }else{
                handlerFailure(message)
                self.naDelegate.onFinishLoading?()
            }
        })
    }
    
    internal func reloadCell(indexPath: IndexPath) {
        self.reloadRows(at: [indexPath], with: .automatic)
    }
}


//MARK: Table View Data Source
@available(iOS 10.0, *)
extension NATableViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let list = listCard?.response {
            naDelegate.selectRow?(card: list[indexPath.row])
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        return listCard?.response?.count ?? 0
    }
}

//MARK: Table View Delegate
@available(iOS 10.0, *)
extension NATableViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.dequeueReusableCell(withIdentifier: "cell") as? CardTableViewCell {
            let item = listCard?.response?[indexPath.row]
            cell.setupTable(card: item, indexPath: indexPath)
            cell.dataSource = self
            return cell
        }else {
            return UITableViewCell()
        }
    }
}

//MARK: Card DataSource
@available(iOS 10.0, *)
extension NATableViewController: CardTableViewDataSource {
    func viewController() -> UIViewController? {
        return self.naDataSource.viewController()
    }
}
