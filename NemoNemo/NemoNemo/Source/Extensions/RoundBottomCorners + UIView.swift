//
//  RoundBottomCorners.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/14.
//

import UIKit

extension UIView {
    
    func roundCorners(cornerRadius: Double) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

}
