//
//  NetworkingManager.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import Foundation
class NetworkService {

    static let shared = NetworkService()

    private let baseURL = "https://dummyjson.com"

    func fetchPosts(completion: @escaping (Result<PostManager, Error>) -> Void) {
        let urlString = baseURL + "/posts"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let posts = try JSONDecoder().decode(PostManager.self, from: data)
                completion(.success(posts))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

