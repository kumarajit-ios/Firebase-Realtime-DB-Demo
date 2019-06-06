//
//  reverseCellCollectionViewCell.swift
//  iAssignment
//
//  Created by Ajit, Kumar (623-Extern) on 02/06/19.
//  Copyright © 2019 MY COMAPNY. All rights reserved.
//

import UIKit

class reverseCell: UICollectionViewCell {
    
    //Override init method
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: imageView.frame.size.height - 50.0, width: imageView.frame.size.width, height: 40.0)
        label.text = ""
        return label
    }()
    
    private func setupUI() {
        addSubview(imageView)
        imageView.addSubview(title)
    }
    
}
