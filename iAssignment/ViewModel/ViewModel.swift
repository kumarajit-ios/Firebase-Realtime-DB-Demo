//
//  ViewModel.swift
//  iAssignment
//
//  Created by Ajit, Kumar (623-Extern) on 04/06/19.
//  Copyright © 2019 MY COMAPNY. All rights reserved.
//

import Foundation

class ViewModel {
    
    /*
     * Fetch gallery from database
     */
    public func fetchGallaryFromDB(completionHandler: @escaping (GalleryResult) -> Void) {
        FBDatabase.fetchDataFromDB { (result) in
            completionHandler(result)
        }
    }
    
}
