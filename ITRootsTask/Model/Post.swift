//
//  Post.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import Foundation
struct PostManager :Codable {
    var posts : [Post]
}
struct Post: Codable {
    
    let id: Int
    let title: String
    let body: String
}
