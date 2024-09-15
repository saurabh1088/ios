//
//  WorkViewController.swift
//  LearningAppiPadUIKit
//
//  Created by Saurabh Verma on 14/09/24.
//

import UIKit

class WorkViewController: UIViewController {
    
    @IBOutlet weak var workLabel: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = navigationBarBackButton()
    }
    
    @IBAction func detailsButtonAction(_ sender: Any) {
        let workDetailsViewController = WorkDetailsViewController()
        self.navigationController?.pushViewController(workDetailsViewController, animated: true)
    }
    
}

extension WorkViewController {
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
