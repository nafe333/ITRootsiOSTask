//
//  PostsViewController.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import UIKit

class PostsViewController: UIViewController {
    
       //MARK: - Properties
    private let viewModel = PostsViewModel()
    
       //MARK: - Outlets
    
    @IBOutlet weak var postsTableView: UITableView!
    
       //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        viewModel.fetchPosts()
        SettingsMenuHelper.addSettingsButton(to: self)
        
    }

       //MARK: - Behaviour
    private func setupTableView() {
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(
            UINib(nibName: "PostsTableViewCell", bundle: nil),
            forCellReuseIdentifier: "postCell"
        )
    }
    
    private func bindViewModel() {
        viewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.postsTableView.reloadData()
            }
        }

        viewModel.onOfflineDataLoaded = { [weak self] in
            DispatchQueue.main.async {
                let alert = UIAlertController(
                    title: "No Internet Connection",
                    message: "You are currently offline. Displaying saved data.",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        }

        viewModel.onError = { [weak self] message in
            DispatchQueue.main.async {
                let alert = UIAlertController(
                    title: "Error",
                    message: message,
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        }
    }



}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "postCell",
            for: indexPath
        ) as! PostsTableViewCell

        let post = viewModel.post(at: indexPath.row)
        cell.useridLabel.text = "User ID: \(post.id)"
        cell.postTitleLabel.text = post.title
        cell.postDescriptionLabel.text = post.body

        return cell
    }

}
