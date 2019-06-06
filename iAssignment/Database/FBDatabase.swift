//
//  FBDatabase.swift
//  iAssignment
//
//  Created by Ajit, Kumar (623-Extern) on 01/06/19.
//  Copyright © 2019 MY COMAPNY. All rights reserved.
//

import Foundation
import Firebase

class FBDatabase {
    
    /*
     * Fetching gallary from Frirebase database
     */
    class public func fetchDataFromDB(completionHandler: @escaping (GalleryResult) -> Void) {
        var rootRef: DatabaseReference!
        rootRef = Database.database().reference()
        rootRef.observeSingleEvent(of: .value, with: { snapshot in
            if !snapshot.exists() {
                print("Error")
            }
            var photoList = [GalleryModel]()
            for child in snapshot.children {
                let childRef = child as! DataSnapshot
                var gallery = GalleryModel()
                
                let albumId = childRef.childSnapshot(forPath: Keys.albumId)
                if let albumId = albumId.value as? Int {
                    gallery.albumId = albumId
                }
                
                let id = childRef.childSnapshot(forPath: Keys.id)
                if let id = id.value as? Int {
                    gallery.id = id
                }
                
                let title = childRef.childSnapshot(forPath: Keys.title)
                if let title = title.value as? String {
                    gallery.title = title 
                }
                
                let url = childRef.childSnapshot(forPath: Keys.url)
                if let url = url.value as? String {
                    gallery.url = url
                }
                
                let thumbnailUrl = childRef.childSnapshot(forPath: Keys.thumbnailUrl)
                if let thumbnailUrl = thumbnailUrl.value as? String {
                    gallery.thumbnailUrl = thumbnailUrl
                }
                
                photoList.append(gallery)
            }
            completionHandler(GalleryResult.success(photoList))
        })
    }
    
}
