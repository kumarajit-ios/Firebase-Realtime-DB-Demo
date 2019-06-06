//
//  ViewController.swift
//  iAssignment
//
//  Created by Ajit, Kumar (623-Extern) on 30/05/19.
//  Copyright © 2019 MY COMAPNY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = ViewModel()
    lazy var reverseView: ReverseCollectionView = {
        let reverseView = ReverseCollectionView()
        reverseView.frame = CGRect(x: 0, y: Margin.paddingTop, width: view.frame.size.width, height: view.frame.size.height - Margin.paddingXXL)
        return reverseView
    }()
    
    var indicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Gallery"
        setupUI()
        getGallaryData()
    }
    
    private func setupUI() {
        view.addSubview(reverseView)
        reverseView.setupUI()
        
        view.addSubview(indicatorView)
        indicatorView.frame = CGRect(x: reverseView.frame.width/2 - Margin.paddingHeight, y: reverseView.frame.height/2 - Margin.paddingHeight, width: Margin.paddingXXXL, height: Margin.paddingXXXL)
        indicatorView.color = .black
    }

    func getGallaryData() {
        indicatorView.startAnimating()
        viewModel.fetchGallaryFromDB { [weak self] (result) in
            self?.indicatorView.stopAnimating()
            switch result {
            case .success(let photolist):
                if let photos = photolist {
                    self?.reverseView.imageList = photos
                    self?.reverseView.reloadCollectionView()
                }
            case .failure(let error):
                print("error = \(error)")
            }
        }
    }

}

