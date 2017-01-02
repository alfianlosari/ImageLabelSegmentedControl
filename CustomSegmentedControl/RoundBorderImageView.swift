//
//  RoundBorderImageView.swift
//  CustomSegmentedControl
//
//  Created by Alfian Losari on 12/31/16.
//  Copyright © 2016 Alfian Losari. All rights reserved.
//

import UIKit

@IBDesignable

class RoundView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2.0
        self.layer.masksToBounds = true
    }
}

class RoundImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.width / 2.0
        self.layer.masksToBounds = true
    }
}

class RoundBorderImageView: UIImageView {

    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = .white
    @IBInspectable var cornerRadius: CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
    }

}
