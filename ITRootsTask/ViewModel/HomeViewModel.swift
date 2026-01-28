//
//  HomeViewModel.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import Foundation
class HomeViewModel {

    private let sections: [ItemSection] = MockData.shared.pageData

    var numberOfSections: Int {
        sections.count
    }

    func numberOfItems(in section: Int) -> Int {
        sections[section].count
    }

    func section(at index: Int) -> ItemSection {
        sections[index]
    }

    func item(at indexPath: IndexPath) -> Item {
        sections[indexPath.section].items[indexPath.row]
    }

    func titleForSection(_ section: Int) -> String {
        sections[section].title
    }
}
