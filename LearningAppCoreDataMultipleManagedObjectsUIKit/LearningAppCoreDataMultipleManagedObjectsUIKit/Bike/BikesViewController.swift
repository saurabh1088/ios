//
//  BikesViewController.swift
//  LearningAppCoreDataMultipleManagedObjectsUIKit
//
//  Created by Saurabh Verma on 14/07/24.
//

import UIKit

class BikesViewController: UIViewController {

    var viewModel: BikesViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewModel.navigationTitle
    }
}
