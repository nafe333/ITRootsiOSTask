//
//  ItemSection.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 27/01/2026.
//

import Foundation
enum ItemSection {
       //MARK: - Properties
    
    case stories([Item])
    case poster([Item])
    var items: [Item] {
        switch self {
        case .stories(let items),
                .poster(let items):
            
            return items
            
        }
    }
    var count: Int {
        return items.count
    }
    var title: String {
        switch self {
        case .stories:
            return "Stories"
        case .poster:
            return "Posters"
            
        }
    }
    
    
    
    
}
