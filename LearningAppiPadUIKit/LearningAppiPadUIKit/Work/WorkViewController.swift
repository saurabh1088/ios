//
//  WorkViewController.swift
//  LearningAppiPadUIKit
//
//  Created by Saurabh Verma on 14/09/24.
//

import UIKit

class WorkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = navigationBarBackButton()
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
