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
        /// Learning
        ///
        /// Here using `register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String)` works.
        ///
        /// However if `register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)` is
        /// used, it results in crash with custom cells IBOutlet properties being nil. So below code doesn't works here
        /// ```
        /// self.collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "calendarCollectionViewCell")
        /// ```
        self.collectionView.register(UINib(nibName: "CalendarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "calendarCollectionViewCell")
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
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCollectionViewCell", for: indexPath) as? CalendarCollectionViewCell {
            cell.dayNumberLabel.text = String(indexPath.row + 1)
            return cell
        }
        return UICollectionViewCell()
    }
}
