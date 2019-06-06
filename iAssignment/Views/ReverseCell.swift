//
//  reverseCellCollectionViewCell.swift
//  iAssignment
//
//  Created by Ajit, Kumar (623-Extern) on 02/06/19.
//  Copyright © 2019 MY COMAPNY. All rights reserved.
//

import UIKit

class ReverseCell: UICollectionViewCell {
    
    //Override init method
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        return imageView
    }()
    
    lazy var titlelabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: imageView.frame.size.height - Margin.paddingHeight, width: imageView.frame.size.width, height: Margin.paddingWidth)
        label.textAlignment = .center
        return label
    }()
    
    var indicatorView = UIActivityIndicatorView()
    
    private func setupUI() {
        backgroundColor = .red
        addSubview(imageView)
        imageView.addSubview(titlelabel)
        
        addSubview(indicatorView)
        indicatorView.frame = CGRect(x: frame.width/2 - 25, y: frame.height/2 - 25, width: Margin.paddingHeight, height: Margin.paddingHeight)
        indicatorView.color = .black
    }
    
    public func loadItemWith(imageUrl: String, ImageName imgTitle: String) {
        indicatorView.startAnimating()
        imageView.loadImage(from: imageUrl) { [weak self] in
            DispatchQueue.main.async {
                self?.indicatorView.stopAnimating()
            }
        }
        titlelabel.text = imgTitle
    }
    
}
