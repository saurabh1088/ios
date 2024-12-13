//
//  ViewController.swift
//  LearningAppStoryboardSegueOptionsUIKit
//
//  Created by Saurabh Verma on 12/12/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let segueType = StoryboardSegueOption.segueTypeFor(index: indexPath),
           let cell = tableView.dequeueReusableCell(withIdentifier: segueType.cellReUseIdentifier()) {
            cell.textLabel?.text = segueType.printableDescription
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showShowFromNavigationControllerViewController",
           let navigationController = segue.destination as? UINavigationController {
            navigationController.modalPresentationStyle = .fullScreen
        } else if segue.identifier == "showShowDetailFromSplitViewController",
            let splitViewController = segue.destination as? ShowDetailFromSplitViewController {
            splitViewController.modalTransitionStyle = .flipHorizontal
        }
    }
}
