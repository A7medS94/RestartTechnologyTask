//
//  UIImageView+Ex.swift
//  RestartTechnologyTask
//
//  Created by Ahmed Samir on 9/23/20.
//  Copyright © 2020 Ahmed Samir. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    // MARK: - Setting Image from URL
    func setImage(from url : String) {
        if url == "" {
            return
        }
        let urlCreated = Foundation.URL(string: url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)!
        self.kf.indicatorType = .activity
        self.kf.setImage(with: urlCreated)
    }
    
    // MARK: - Setting Image from URL with PlaceholderImage and ImageTransition
    func setImage(from url: String?, _ placeholderImgName: String, _ imageTransition: ImageTransition) {
        var stringURL: String = ""
        if let urlString: String = url{
            stringURL = urlString
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: stringURL), placeholder: UIImage(named: placeholderImgName), options: [.transition(imageTransition)], progressBlock: nil)
    }
}
