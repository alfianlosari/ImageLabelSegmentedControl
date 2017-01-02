//
//  SegmentedControl.swift
//  CustomSegmentedControl
//
//  Created by Alfian Losari on 12/31/16.
//  Copyright © 2016 Alfian Losari. All rights reserved.
//

import UIKit
@IBDesignable

class SegmentedControl: UIControl {

    private var labels = [UILabel]()
    var thumbView = UIView()
    
    var items = ["Item 1", "Item 2", "Item 3",
                 "Item 1", "Item 2", "Item 3",
                 "Item 1", "Item 2", "Item 3"] {
        didSet {
            self.setupLabels()
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    func setupView() {
        layer.cornerRadius = self.frame.height / 2.0
        layer.borderColor = UIColor(white: 1.0, alpha: 0.5).cgColor
        layer.borderWidth = 2
        
        backgroundColor = UIColor.clear
        
        self.setupLabels()
        self.insertSubview(thumbView, at: 0)
    }
    
    func displayNewSelectedIndex() {
        let label = labels[self.selectedIndex]
        self.thumbView.frame = label.frame
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var selectFrame = self.bounds
        let newWidth = selectFrame.width / CGFloat(items.count)
        
        selectFrame.size.width = newWidth
        thumbView.frame = selectFrame
        thumbView.backgroundColor = .white
        thumbView.layer.cornerRadius = thumbView.frame.height / 2.0
        
        let labelHeight = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(self.labels.count)
        
        for index in 0...labels.count - 1 {
            let label = labels[index]
            let xPosition = CGFloat(index) * labelWidth
            
            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: labelHeight)
        }
        
        
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        var calculatedIndex: Int?
        for (index, item) in self.labels.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
                break
            }
        }
        
        if let calculatedIndex = calculatedIndex {
            self.selectedIndex = calculatedIndex
            self.sendActions(for: .valueChanged)
        }
        
        return false
        
    }
    
    func setupLabels() {
        labels.forEach { $0.removeFromSuperview() }
        labels.removeAll(keepingCapacity: true)
        
        for i in 1...items.count {
            let label = UILabel(frame: CGRect.zero)
            label.text = items[i - 1]
            label.textAlignment = .center
            label.textColor = UIColor(white: 0.5, alpha: 1.0)
            self.addSubview(label)
            self.labels.append(label)
        }
        
    }
    
    

}
