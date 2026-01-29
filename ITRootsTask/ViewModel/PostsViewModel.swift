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
    var onOfflineDataLoaded: (() -> Void)?

    
    // MARK: - Behaviour
    func fetchPosts() {
        NetworkMonitor.shared.checkConnection { [weak self] isConnected in
            guard let self = self else { return }

            if isConnected {
                self.internetConnectedAction()
            } else {
                self.internetNotConnectedAction()
            }
        }
    }

    
    private func savePostsToCoreData(_ posts: [Post]) {
        CoreDataManager.shared.clearPosts()
        for post in posts {
            CoreDataManager.shared.savePost(id: post.id, body: post.body, title: post.title)
        }
    }
    
    func numberOfRows() -> Int {
        posts.count
    }
    
    func post(at index: Int) -> Post {
        posts[index]
    }
    
    private func internetConnectedAction(){
        NetworkService.shared.fetchPosts { [weak self] result in
            switch result {
            case .success(let postManager):
                DispatchQueue.main.async {
                    self?.posts = postManager.posts
                    self?.onDataUpdated?()
                    self?.savePostsToCoreData(postManager.posts)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.onError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func internetNotConnectedAction() {
        CoreDataManager.shared.fetchPosts { [weak self] savedPosts in
            DispatchQueue.main.async {
                guard let self = self else { return }

                if !savedPosts.isEmpty {
                    self.posts = savedPosts.map {
                        Post(
                            id: Int($0.id),
                            title: $0.title ?? "",
                            body: $0.body ?? ""
                        )
                    }
                    self.onDataUpdated?()
                    self.onOfflineDataLoaded?()
                } else {
                    self.onError?("No internet connection and no saved posts.")
                }
            }
        }
    }

}
