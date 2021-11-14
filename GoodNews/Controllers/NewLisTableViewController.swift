//
//  NewLisTableViewController.swift
//  GoodNews
//
//  Created by do Nascimento Monteiro, Thiago on 20/10/21.
//

import Foundation
import UIKit
class NewLisTableViewController: UITableViewController {
    // MARK: - Properties
    private var articleViewModel: ArticleListViewModel!
    // MARK: - IBOutlets
    @IBOutlet var customTableView: UITableView!
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    // MARK: - Methods
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0cf790498275413a9247f8b94b3843fd") else { return }
        MyWebService().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.customTableView.reloadData()
                }
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleViewModel == nil ? 0 : self.articleViewModel.numberOfRows
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleViewModel.numberOfSections(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found.")
        }
        let articleViewModel = self.articleViewModel.articleIndex(indexPath.row)
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        cell.selectionStyle = .none
        return cell
    }
}


