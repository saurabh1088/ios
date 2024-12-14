//
//  CenterViewController.swift
//  LearningAppFrameBoundCenterUIKit
//
//  Created by Saurabh Verma on 14/12/24.
//

import UIKit

class CenterViewController: UIViewController {
    
    @IBOutlet weak var exampleSuperViewOne: UIView!
    
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var darkRedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func animateAction(_ sender: Any) {
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self else { return }
            self.greenView.center = CGPoint(x: 0, y: 0)
            self.redView.center = CGPoint(x: 50, y: 0)
            self.darkRedView.center = CGPoint(x: 100, y: 0)
        }
    }
    
}
