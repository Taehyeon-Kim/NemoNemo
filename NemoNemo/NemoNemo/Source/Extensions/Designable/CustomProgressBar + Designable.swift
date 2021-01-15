//
//  CustomProgressBar + Designable.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/14.
//

import Foundation

import UIKit

@IBDesignable
class PlainHorizontalProgressBar: UIView {
    @IBInspectable var color: UIColor? = .gray

    var progress: CGFloat = 0.5 {
        didSet { setNeedsDisplay() }
    }

    private let progressLayer = CALayer()
    private let backgroundMask = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(progressLayer)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.addSublayer(progressLayer)
    }


    override func draw(_ rect: CGRect) {
  
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: 20).cgPath

        layer.mask = backgroundMask
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.cornerRadius = 7
        

        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress, height: rect.height))
        progressLayer.frame = progressRect

        layer.addSublayer(progressLayer)
        progressLayer.backgroundColor = color?.cgColor
    }
}
