//
//  ActionButton.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import UIKit


public class ActionButton: UIButton {

    public var title: String? {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        layer.cornerRadius = 10
        clipsToBounds = true
        setTitleColor(.white, for: .normal)
        applyDropShadow(radius: 10)
    }

    private func applyDropShadow(radius: CGFloat, opacity: Float = 0.3, color: UIColor = UIColor.black.withAlphaComponent(0.8)) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = true ? UIScreen.main.scale : 1
    }
}
