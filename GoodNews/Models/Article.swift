//
//  Article.swift
//  GoodNews
//
//  Created by do Nascimento Monteiro, Thiago on 20/10/21.
//

import Foundation
// MARK: - Models
struct ArticleList: Decodable {
    let articles: [Article]
}
struct Article: Decodable {
    let title: String
    let description: String
}
struct ArticleListViewModel {
    let articles: [Article]
}
extension ArticleListViewModel {
    var numberOfRows: Int {
        return 1
    }
    func numberOfSections(_ section: Int) -> Int {
        return self.articles.count
    }
    func articleIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

