//
//  UICollectionView+Reverse.swift
//  iAssignment
//
//  Created by Ajit, Kumar (623-Extern) on 02/06/19.
//  Copyright © 2019 MY COMAPNY. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    /*
     * reverse view
     */
    func reverseView(option: Bool) {
        if option {
            self.transform = CGAffineTransform.init(rotationAngle: (-(CGFloat)(Double.pi)))
        }
    }
    
}
