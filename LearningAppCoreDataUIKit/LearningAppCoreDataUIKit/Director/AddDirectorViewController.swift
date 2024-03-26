//
//  AddDirectorViewController.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 26/03/24.
//

import UIKit

class AddDirectorViewController: UIViewController {
    
    var viewModel: DirectorViewModel!
    var addDirectorCallback: BasicBlock?
    
    @IBOutlet weak var directorNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addDirectorAction(_ sender: Any) {
        if let directorName = directorNameTextField.text {
            viewModel.add(director: directorName)
            if let action = addDirectorCallback {
                action()
            }
        }
    }
    
}
