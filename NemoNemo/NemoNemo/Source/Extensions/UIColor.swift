//
//  UIColor.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/14.
//

import UIKit

enum AssetsColor {
    
    // Main Color
    case mainColor
    // Sub Color
    case subColor
    
    case defaultWhiteColor
}

extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor {
    
    switch name {
    
    case .mainColor:
        return UIColor(named: "mainColor")!
        
    case .subColor:
        return UIColor(named: "subColor")!
        
    case .defaultWhiteColor:
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
    }
    
  }
}
