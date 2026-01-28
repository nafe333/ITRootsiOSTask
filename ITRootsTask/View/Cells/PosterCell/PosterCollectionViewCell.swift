//
//  PosterCollectionViewCell.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
    
       //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var posterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = min(containerView.bounds.width, containerView.bounds.height) / 8
    }
    
    func setup(_ item: Item) {
        posterImageView.image = UIImage(named: item.image)
        posterNameLabel.text = item.title
    }

}
