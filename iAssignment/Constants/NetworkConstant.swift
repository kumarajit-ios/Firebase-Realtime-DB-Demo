//
//  NetworkConstant.swift
//  iAssignment
//
//  Created by Ajit, Kumar (623-Extern) on 01/06/19.
//  Copyright © 2019 MY COMAPNY. All rights reserved.
//

import Foundation
import UIKit

struct Margin {
    static let padding: CGFloat = 5.0
    static let paddingTop: CGFloat = 75.0
    static let paddingHeight: CGFloat = 50.0
    static let paddingWidth: CGFloat = 40.0
    static let paddingXXL: CGFloat = 100.0
    static let paddingXXXL: CGFloat = 100.0
}

struct Keys {
    static let albumId = "albumId"
    static let id = "id"
    static let title = "title"
    static let url = "url"
    static let thumbnailUrl = "thumbnailUrl"
}

enum GalleryResult {
    case success([GalleryModel]?)
    case failure(Error)
}
