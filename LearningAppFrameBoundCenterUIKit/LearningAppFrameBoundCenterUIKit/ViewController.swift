//
//  ViewController.swift
//  LearningAppFrameBoundCenterUIKit
//
//  Created by Saurabh Verma on 14/12/24.
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PropertiesOption.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let option = PropertiesOption.segueTypeFor(index: indexPath),
           let cell = tableView.dequeueReusableCell(withIdentifier: option.cellReUseIdentifier()) {
            cell.textLabel?.text = option.printableDescription
            return cell
        }
        return UITableViewCell()
    }
}
