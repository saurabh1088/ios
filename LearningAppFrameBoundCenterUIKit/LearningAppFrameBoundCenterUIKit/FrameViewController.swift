//
//  FrameViewController.swift
//  LearningAppFrameBoundCenterUIKit
//
//  Created by Saurabh Verma on 14/12/24.
//

import UIKit
import OSLog

class FrameViewController: UIViewController {
    
    @IBOutlet weak var exampleSuperViewOne: UIView!
    @IBOutlet weak var exampleSubViewOne: UIView!
    @IBOutlet weak var animateFrameButton: UIButton!
    @IBOutlet weak var animateFramePositionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.viewBounds.info("Current frame of exampleSuperViewOne \(self.exampleSuperViewOne.frame.debugDescription)")
        Logger.viewBounds.info("Current frame of exampleSubViewOne \(self.exampleSubViewOne.frame.debugDescription)")
    }
    
    @IBAction func animateFrameAction(_ sender: Any) {
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self else { return }
            let originalX = self.exampleSubViewOne.frame.origin.x
            let originalY = self.exampleSubViewOne.frame.origin.y
            exampleSubViewOne.frame = CGRect(x: originalX, y: originalY, width: 200, height: 100)
        }
    }
    
    @IBAction func animateFramePositionAction(_ sender: Any) {
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self else { return }
            let originalWidth = self.exampleSubViewOne.frame.width
            let originalHeight = self.exampleSubViewOne.frame.height
            exampleSubViewOne.frame = CGRect(x: 0, y: 0, width: originalWidth, height: originalHeight)
        }
    }
}
