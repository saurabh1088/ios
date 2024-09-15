//
//  CalendarViewController.swift
//  LearningAppiPadUIKit
//
//  Created by Saurabh Verma on 14/09/24.
//

import UIKit

class CalendarViewController: UIViewController {

    
    @IBOutlet weak var calendarLabel: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = navigationBarBackButton()
    }
    
    @IBAction func detailsButtonAction(_ sender: Any) {
        let calendarDetailsViewController = CalendarDetailsViewController()
        self.navigationController?.pushViewController(calendarDetailsViewController, animated: true)
    }
    
}

extension CalendarViewController {
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
