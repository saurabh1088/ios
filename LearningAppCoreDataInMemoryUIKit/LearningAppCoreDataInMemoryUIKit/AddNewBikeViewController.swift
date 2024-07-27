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

#Preview {
    // TODO: Refactor BikesViewModel so that mock data could be provided here.
    let viewcontroller = Storyboard.Main.addNewBikeViewController.instantiate as? AddNewBikeViewController
    let viewModel = BikesViewModel(managedContext: CoreDataMemoryOption.inMemory.persistentContainer.viewContext,
                                   memoryOption: CoreDataMemoryOption.inMemory)
    viewcontroller?.viewModel = viewModel
    return viewcontroller!
}
