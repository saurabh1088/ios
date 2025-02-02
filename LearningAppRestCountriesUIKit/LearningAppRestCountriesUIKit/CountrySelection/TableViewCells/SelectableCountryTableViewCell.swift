//
//  SelectableCountryTableViewCell.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 30/01/25.
//

import UIKit

class SelectableCountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCountryName(_ name: String) {
        countryNameLabel.text = name
    }
    
    func setAccessoryViewWithImage(named: String = "chevron.compact.right") {
        let indicatorImage = UIImage(systemName: named)
        let accessoryImageView = UIImageView(image: indicatorImage)
        accessoryImageView.backgroundColor = .clear
        self.accessoryView = accessoryImageView
    }
}
