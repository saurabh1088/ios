//
//  CalendarDetailsViewController.swift
//  LearningAppiPadUIKit
//
//  Created by Saurabh Verma on 15/09/24.
//

import UIKit

class CalendarDetailsViewController: UIViewController,
                                     UICollectionViewDataSource,
                                     UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = navigationBarBackButton()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

extension CalendarDetailsViewController {
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

extension CalendarDetailsViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
