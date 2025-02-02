//
//  SelectableTableViewCell.swift
//  LearningAppRestCountriesUIKit
//
//  Created by Saurabh Verma on 02/02/25.
//

import UIKit

class SelectableTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(
            withText text: String,
            textColor: UIColor = .label,
            font: UIFont = .systemFont(ofSize: 17),
            backgroundColor: UIColor = .clear,
            accessoryImageName: String? = "chevron.compact.right"
    ) {
        label.text = text
        label.textColor = textColor
        label.font = font
        self.backgroundColor = backgroundColor
        
        if let imageName = accessoryImageName {
            setAccessoryViewWithImage(named: imageName)
        } else {
            accessoryView = nil
        }
    }
        
    private func setAccessoryViewWithImage(named: String) {
        let indicatorImage = UIImage(systemName: named)
        let accessoryImageView = UIImageView(image: indicatorImage)
        accessoryImageView.backgroundColor = .clear
        accessoryView = accessoryImageView
    }
}
