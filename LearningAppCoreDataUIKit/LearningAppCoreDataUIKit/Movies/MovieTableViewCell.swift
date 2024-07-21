//
//  MovieTableViewCell.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 21/07/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var year: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
