//
//  AddNewBikeViewController.swift
//  LearningAppCoreDataInMemoryUIKit
//
//  Created by Saurabh Verma on 08/06/24.
//

import UIKit

class AddNewBikeViewController: UIViewController {
    
    var viewModel: BikesViewModel!
    
    @IBOutlet weak var bikeNameTextField: UITextField!
    
    @IBOutlet weak var bikeMakerTextField: UITextField!
    
    @IBOutlet weak var bikeEngineCCTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add a bike"
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        if let name = bikeNameTextField.text,
           let maker = bikeMakerTextField.text,
           let engineCC = bikeEngineCCTextField.text,
           let engineCCInt = Int(engineCC) {
            viewModel.addBike(name: name, maker: maker, engineCapacity: engineCCInt)
        }
    }
}
