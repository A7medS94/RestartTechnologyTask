//
//  UIView+Ex.swift
//  RestartTechnologyTask
//
//  Created by Ahmed Samir on 9/22/20.
//  Copyright © 2020 Ahmed Samir. All rights reserved.
//

import UIKit

extension UIView{
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
    }
    
    func circleView(width: CGFloat) {
        self.layer.cornerRadius = width / 2
        self.clipsToBounds = true
    }
}
