//
//  RoundImageStackView.swift
//  CustomSegmentedControl
//
//  Created by Alfian Losari on 12/31/16.
//  Copyright © 2016 Alfian Losari. All rights reserved.
//

import UIKit

class RoundImageStackView: UIView {
    
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadView()
    }
    
    func loadView() {
        let bundle = Bundle(for: type(of: self))
        let theView = bundle.loadNibNamed("RoundImageStackView", owner: self, options: nil)?.first as! UIView
        self.addSubview(theView)
        theView.frame = self.bounds
    }

}
