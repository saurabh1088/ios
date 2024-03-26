//
//  FullScreenWideButton.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 24/03/24.
//

import UIKit

@IBDesignable
class FullScreenWideButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func draw(_ rect: CGRect) {
        // This doesn't works, one need to set color to layer's backgroundColor
        // self.backgroundColor = UIColor.neonMaroon
        self.layer.backgroundColor = UIColor.neonMaroon.cgColor
    }
}
