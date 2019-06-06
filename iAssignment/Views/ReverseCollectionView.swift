//
//  ReverseCollectionView.swift
//  iAssignment
//
//  Created by Ajit, Kumar (623-Extern) on 02/06/19.
//  Copyright © 2019 MY COMAPNY. All rights reserved.
//

import UIKit

class ReverseCollectionView: UIView {
    
    let reverseCellIdentifier = "reverseCellIdentifier"
    var imageList: [GalleryModel]?
    
    lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: Margin.padding, left: Margin.padding, bottom: Margin.padding, right: Margin.padding)
        let width = (frame.width - Margin.paddingWidth) / 3
        layout.itemSize = CGSize(width: width , height: width)
        layout.scrollDirection = .vertical
        return layout
    }()
    
    lazy var reverseCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ReverseCell.self, forCellWithReuseIdentifier: reverseCellIdentifier)
        collectionView.backgroundColor = .white
        collectionView.reverseView(option: true)
        return collectionView
    }()
    
    public func setupUI() {
        addSubview(reverseCollectionView)
        reverseCollectionView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
    public func reloadCollectionView() {
        reverseCollectionView.reloadData()
    }

}

extension ReverseCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}

extension ReverseCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let images = imageList else {
            return 0
        }
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reverseCellIdentifier, for: indexPath) as! ReverseCell
        cell.reverseView(option: true)
        
        if let images = imageList {
            let image = images[indexPath.item]
            let itemName = "item \(indexPath.item)"
            if let thumbUrl = image.thumbnailUrl {
                cell.loadItemWith(imageUrl: thumbUrl, ImageName: itemName)
            }
        }
        
        return cell
    }
    
}
