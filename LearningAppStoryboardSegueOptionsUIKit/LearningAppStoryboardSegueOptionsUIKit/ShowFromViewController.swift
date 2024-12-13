//
//  ShowFromViewController.swift
//  LearningAppStoryboardSegueOptionsUIKit
//
//  Created by Saurabh Verma on 13/12/24.
//

import UIKit

class ShowFromViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "This view controller is shown from another view controller using a segue with options"
    }
}
