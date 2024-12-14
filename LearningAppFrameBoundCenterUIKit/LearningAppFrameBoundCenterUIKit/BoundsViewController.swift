//
//  BoundsViewController.swift
//  LearningAppFrameBoundCenterUIKit
//
//  Created by Saurabh Verma on 14/12/24.
//

import UIKit
import OSLog

class BoundsViewController: UIViewController {
    
    @IBOutlet weak var exampleSuperViewOne: UIView!
    @IBOutlet weak var exampleSubViewOne: UIView!
    @IBOutlet weak var animateBoundsSize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.viewBounds.info("Current frame of exampleSuperViewOne \(self.exampleSuperViewOne.frame.debugDescription)")
        Logger.viewBounds.info("Current frame of exampleSubViewOne \(self.exampleSubViewOne.frame.debugDescription)")
    }
    
    @IBAction func animateBoundsSizeAction(_ sender: Any) {
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self else { return }
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            self.exampleSubViewOne.bounds = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        }
    }
    
    @IBAction func clipsToBoundsAction(_ sender: Any) {
        exampleSuperViewOne.clipsToBounds = false
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self else { return }
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            self.exampleSubViewOne.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        }
    }
}
