//
//  HomeViewController.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import UIKit

class HomeViewController: UIViewController {
    
       //MARK: - Properties
    private let sections = MockData.shared.pageData
    private let viewModel = HomeViewModel()
    
       //MARK: - Outlets
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    
       //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
setupCollectionView()
        SettingsMenuHelper.addSettingsButton(to: self)
    }
    
       //MARK: - Behaviour
    private func setupCollectionView(){
        itemsCollectionView.collectionViewLayout = createLayout()
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        itemsCollectionView.register(UINib(nibName: "StoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "storiesCell")
            itemsCollectionView.register(UINib(nibName: "PosterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "posterCell")
        itemsCollectionView.register(
            UINib(nibName: "SectionsHeaderView", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "sectionHeaderView"
        )
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil  }
            let section = self.sections[sectionIndex]
            switch section {
            case .stories:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(70), heightDimension: .absolute(70)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 10, bottom: 30, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
            case .poster:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                      heightDimension: .fractionalHeight(0.8))
                )
                
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                                      heightDimension: .fractionalHeight(0.8)),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 0, leading: 10, bottom: 30, trailing: 10)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                section.supplementariesFollowContentInsets = false
                return section
           
            }
        }
    }
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
   
    
}

   //MARK: - Collection view delegate and datasource methods

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let section = viewModel.section(at: indexPath.section)
        let item = viewModel.item(at: indexPath)

        switch section {
        case .stories:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "storiesCell",
                for: indexPath
            ) as! StoriesCollectionViewCell
            cell.setup(item)
            return cell

        case .poster:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "posterCell",
                for: indexPath
            ) as! PosterCollectionViewCell
            cell.setup(item)
            return cell
        }
    }
    
    // for header
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }

        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "sectionHeaderView",
            for: indexPath
        ) as! SectionsHeaderView

        header.configure(
            title: viewModel.titleForSection(indexPath.section)
        )

        return header
    }
}
