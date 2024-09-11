//
//  HomeViewController.swift
//  LearningAppiPadUIKit
//
//  Created by Saurabh Verma on 10/09/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var detailsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func detailsButtonAction(_ sender: Any) {
        let detailViewController = HomeDetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
