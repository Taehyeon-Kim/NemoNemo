//
//  CircleView + Designable.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/14.
//

import UIKit

@IBDesignable public class RoundedUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    
    override public func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.masksToBounds = true
    }

}


@IBDesignable public class RoundedUIImageView: UIImageView {

    override public func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.masksToBounds = true
    }
}

@IBDesignable public class RoundedUIButton: UIButton {

    override public func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.masksToBounds = true
    }
}
