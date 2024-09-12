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
        self.navigationController?.navigationBar.topItem?.leftBarButtonItem = navigationBarBackButton()
    }
    
    @IBAction func detailsButtonAction(_ sender: Any) {
        let detailViewController = HomeDetailViewController()
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func navigationBarBackButton() -> UIBarButtonItem {
        let backBarButton = UIBarButtonItem(image: UIImage(systemName: "arrowshape.backward.fill"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(goBack))
        backBarButton.tintColor = UIColor(named: "vintageRed")
        return backBarButton
    }
}
