//
//  CalendarDetailsViewController.swift
//  LearningAppiPadUIKit
//
//  Created by Saurabh Verma on 15/09/24.
//

import UIKit

class CalendarDetailsViewController: UIViewController,
                                     UICollectionViewDataSource,
                                     UICollectionViewDelegate,
                                     UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = navigationBarBackButton()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        /// `Learning`
        ///
        /// Here using `register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String)` works.
        ///
        /// However if `register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)` is
        /// used, it results in crash with custom cells IBOutlet properties being nil. So below code doesn't works here
        /// ```
        /// self.collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "calendarCollectionViewCell")
        /// ```
        self.collectionView.register(UINib(nibName: "CalendarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "calendarCollectionViewCell")
        
        /// `Learning`
        /// This is one approach to set collection view flow layout, the other one being to use UICollectionViewDelegateFlowLayout
        /*
         let layout = UICollectionViewFlowLayout()
         layout.minimumLineSpacing = 1
         layout.minimumInteritemSpacing = 1
         layout.sectionInset = UIEdgeInsets(top: 10, left: 25, bottom: 20, right: 25);
         layout.scrollDirection = .vertical
         
         let cellWidth = 160
         layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
         self.collectionView.collectionViewLayout = layout
         */
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
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCollectionViewCell", for: indexPath) as? CalendarCollectionViewCell {
            if indexPath.row == 0 {
                cell.dayNumberLabel.text = "SUN"
            } else if indexPath.row == 1 {
                cell.dayNumberLabel.text = "MON"
            } else if indexPath.row == 2 {
                cell.dayNumberLabel.text = "TUE"
            } else if indexPath.row == 3 {
                cell.dayNumberLabel.text = "WED"
            } else if indexPath.row == 4 {
                cell.dayNumberLabel.text = "THU"
            } else if indexPath.row == 5 {
                cell.dayNumberLabel.text = "FRI"
            } else if indexPath.row == 6 {
                cell.dayNumberLabel.text = "SAT"
            } else {
                cell.dayNumberLabel.text = String(indexPath.row - 6)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row < 7 {
            return CGSize(width: 160, height: 80)
        }
        return CGSize(width: 160, height: 160)
    }
}
