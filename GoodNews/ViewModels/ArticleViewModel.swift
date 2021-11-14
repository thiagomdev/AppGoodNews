//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by do Nascimento Monteiro, Thiago on 20/10/21.
//

import Foundation
// MARK: - ViewModels
struct ArticleViewModel {
    let article: Article
    init(_ article: Article) {
        self.article = article
    }
}
extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    var description: String {
        return self.article.description
    }
}
