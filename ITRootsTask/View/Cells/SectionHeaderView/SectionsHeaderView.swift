//
//  SectionsHeaderView.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import UIKit
import MOLH

class SectionsHeaderView: UICollectionReusableView {

    @IBOutlet weak var sectionHeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(title: String) {
        sectionHeaderLabel.text = title
        sectionHeaderLabel.textAlignment = MOLHLanguage.currentAppleLanguage() == "ar" ? .right : .left

    }

}
