//
//  CarrouselTableViewCell.swift
//  NACardSDK
//
//  Created by Ruan Gustavo on 30/08/18.
//  Copyright © 2018 asfcarvalho. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class CarrouselTableViewCell: BaseViewController {
   
    var listUrl: [Urls]?
    var listIndexPath = [IndexPath]()
    var listIndexPathPosition = 0
    var time: Timer?
    var presenter: CarouselPresenter?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    init() {
        super.init(nibName: "CarrouselTableViewCell", bundle: Bundle(for: CarrouselTableViewCell.self))
        self.view.backgroundColor = self.cardBackgroundColor()
    }
    
    
    deinit {
        self.presenter?.stopTimer(timer: &self.time)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = CarouselPresenter()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.cellIdentifier)
        self.collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
}

@available(iOS 10.0, *)
extension CarrouselTableViewCell {
    public func setupCell(metadata: Metadata?) {
        self.listUrl = metadata?.urls
        if let duration = metadata?.duration, let time = Double(duration) {
            DispatchQueue.main.async() {
                self.changeBanner(withTime: time)
            }
        }
        
        
    }
    
    func changeBanner(withTime time: Double) {
        self.presenter?.stopTimer(timer: &self.time)
        
        self.presenter?.startTimer(withTimeInterval: time, timer: &self.time) { (time) in
            self.collectionView.scrollToItem(at: self.listIndexPath[self.listIndexPathPosition], at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
            self.pageControl.currentPage = self.listIndexPathPosition
            self.listIndexPathPosition += 1
            
            if self.listIndexPathPosition >= self.listIndexPath.count {
                self.listIndexPathPosition = 0
            }
        }     
        
    }
}

@available(iOS 10.0, *)
extension CarrouselTableViewCell: UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        
        pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
    
}

//MARK: Collection delegate and datasourde
@available(iOS 10.0, *)
extension CarrouselTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.bounds.width * 0.93, height: collectionView.bounds.height)
        return size
    }
}

@available(iOS 10.0, *)
extension CarrouselTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pageControl.numberOfPages = listUrl?.count ?? 0
        return listUrl?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.cellIdentifier, for: indexPath) as? ImageCollectionViewCell {
            cell.setupCell(url: listUrl?[indexPath.row].image)
            listIndexPath.append(indexPath)
            cell.layoutIfNeeded()
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
}
