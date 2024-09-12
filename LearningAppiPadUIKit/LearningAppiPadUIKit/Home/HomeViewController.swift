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
        let backButton = UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.fill"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(goBack))
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = backButton
    }
    
    @IBAction func detailsButtonAction(_ sender: Any) {
        let detailViewController = HomeDetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
