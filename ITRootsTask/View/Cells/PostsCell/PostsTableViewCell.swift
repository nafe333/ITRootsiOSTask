//
//  PostsTableViewCell.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
       //MARK: - Outlets
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var useridLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    
       //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
}
