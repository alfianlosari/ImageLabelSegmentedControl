//
//  RoundImageTextSegmentedControl.swift
//  CustomSegmentedControl
//
//  Created by Alfian Losari on 12/31/16.
//  Copyright © 2016 Alfian Losari. All rights reserved.
//

import UIKit
@IBDesignable

class RoundImageTextSegmentedControl: UIControl {
    
    let darkGreyColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
    let orangeColor = UIColor(red: 254/255, green: 165/255, blue: 91/255, alpha: 1.0)


    var stackView: UIStackView!
    
    var items: [(title: String, image: UIImage?)] = [
        ("None", nil),
        ("Male", #imageLiteral(resourceName: "male")),
        ("Female", #imageLiteral(resourceName: "female"))
        ] {
        didSet {
            self.setupItemViews()
        }
    }
    
    var selectedIndex: Int = 0 {
        didSet {
            self.displayNewSelectedIndex()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupItemViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
        self.setupItemViews()
    }
    
    func setupView() {
        self.stackView = UIStackView()
        self.stackView.axis = .horizontal
        self.stackView.distribution = .fillEqually
        self.stackView.spacing = 8.0
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.stackView)
        
        self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15.0).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15.0).isActive = true
    }
    
    func displayNewSelectedIndex() {
        for verticalSV in self.stackView.arrangedSubviews {
            guard let roundImageSV = verticalSV as? RoundImageStackView else { continue }
            roundImageSV.roundView.layer.borderWidth = 0
            roundImageSV.imageView.tintColor = darkGreyColor
        }
        
        let roundImageStackView = self.stackView.arrangedSubviews[self.selectedIndex] as! RoundImageStackView
        roundImageStackView.roundView.layer.borderColor = orangeColor.cgColor
        roundImageStackView.roundView.layer.borderWidth = 2.0
        roundImageStackView.imageView.tintColor = orangeColor
    }
    
    func setupItemViews() {
        self.stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        items.forEach { item in
            let roundImageStackView = RoundImageStackView(frame: CGRect.zero)
            roundImageStackView.textLabel.text = item.title
            roundImageStackView.imageView.image = item.image
            roundImageStackView.imageView.tintColor = darkGreyColor
            self.stackView.addArrangedSubview(roundImageStackView)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        var calculatedIndex: Int?
        
        for (index, item) in self.stackView.arrangedSubviews.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }
        
        if let calculatedIndex = calculatedIndex {
            self.selectedIndex = calculatedIndex
            self.sendActions(for: .valueChanged)
        }
        
    }


}
