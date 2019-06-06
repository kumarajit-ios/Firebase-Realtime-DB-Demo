//
//  UIImageView+Download.swift
//  iAssignment
//
//  Created by Ajit, Kumar (623-Extern) on 02/06/19.
//  Copyright © 2019 MY COMAPNY. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    /*
     * Download the image from url
     */
    func loadImage(from link: String, completionHandler: @escaping () -> Void) {
        guard let url = URL(string: link) else {
            return
        }
        contentMode = .scaleAspectFit
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard let imageData = data else {
                return
            }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async() {
                self.image = image
            }
            
            completionHandler()
        }
        dataTask.resume()
    }
    
}
