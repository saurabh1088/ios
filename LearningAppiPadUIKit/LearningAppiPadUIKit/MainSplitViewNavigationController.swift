//
//  MainSplitViewNavigationController.swift
//  LearningAppiPadUIKit
//
//  Created by Saurabh Verma on 08/09/24.
//

import UIKit

class MainSplitViewNavigationController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setPrimaryMenuViewToBeAlwaysVisible()
    }
}

extension MainSplitViewNavigationController {
    private func setPrimaryMenuViewToBeAlwaysVisible() {
        self.preferredDisplayMode = .oneBesideSecondary
        self.presentsWithGesture = false
        self.primaryBackgroundStyle = .sidebar
    }
}
