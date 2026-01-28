//
//  PostsViewModel.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import Foundation
class PostsViewModel {

    // MARK: - Properties
     var posts: [Post] = []

    var onDataUpdated: (() -> Void)?
    var onError: ((String) -> Void)?

    // MARK: - Behaviour
    func fetchPosts() {
        NetworkService.shared.fetchPosts { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let postManager):
                    self?.posts = postManager.posts
                    self?.onDataUpdated?()

                case .failure(let error):
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }

    func numberOfRows() -> Int {
        posts.count
    }

    func post(at index: Int) -> Post {
        posts[index]
    }
}
