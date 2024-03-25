//
//  FullScreenWideButton.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 24/03/24.
//

import UIKit

@IBDesignable
class FullScreenWideButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        // This doesn't works, one need to set color to layer's backgroundColor
        // self.backgroundColor = UIColor.neonMaroon
        self.layer.backgroundColor = UIColor.neonMaroon.cgColor
    }
}
