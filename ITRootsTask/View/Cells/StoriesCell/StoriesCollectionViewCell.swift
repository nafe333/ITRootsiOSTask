//
//  StoriesCollectionViewCell.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
       //MARK: - Outlets
    
    @IBOutlet weak var storyImageView: UIImageView!
    
    
       //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        storyImageView.layer.cornerRadius = storyImageView.frame.height / 2
        storyImageView.clipsToBounds = true
    }
    
       //MARK: - Behaviour
    func setup(_ item: Item) {
        storyImageView.image = UIImage(named: item.image)
        storyImageView.layoutIfNeeded()
        storyImageView.layer.cornerRadius = storyImageView.frame.height / 2
    }

}
