//
//  HomeViewController.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import UIKit

class HomeViewController: UIViewController {
    
       //MARK: - Outlets
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    
       //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
