//
//  NEXONLv1Gothic + UIFont.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/14.
//

import UIKit

enum NEXONLv1GothicFontSize
{
    case Light
    case Regular
    case Bold
}

extension UIFont
{
    static func NEXONLv1GothicFontSize(weight: NEXONLv1GothicFontSize = .Regular, size : CGFloat = 12) -> UIFont
    {
        return UIFont(name: "NEXONLv1Gothic\(weight)", size: size)!
    }
}
