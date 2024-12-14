//
//  BoundsViewController.swift
//  LearningAppFrameBoundCenterUIKit
//
//  Created by Saurabh Verma on 14/12/24.
//

import UIKit

// TODO: Need to explore this example in detail
class BoundsViewController: UIViewController {
    
    @IBOutlet weak var exampleSuperViewOne: UIView!
    @IBOutlet weak var exampleSubViewOne: UIView!
    @IBOutlet weak var animateBoundsSize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Current frame of exampleSubViewOne \(exampleSubViewOne.frame)")
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
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self else { return }
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            self.exampleSubViewOne.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        }
    }
}
