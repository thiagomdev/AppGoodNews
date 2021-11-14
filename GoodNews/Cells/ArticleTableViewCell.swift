//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by do Nascimento Monteiro, Thiago on 20/10/21.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    // MARK: - Methods
    public func setupCell(article: Article) {
        self.titleLabel.text = article.title
        self.descriptionLabel.text = article.description
    }
}

