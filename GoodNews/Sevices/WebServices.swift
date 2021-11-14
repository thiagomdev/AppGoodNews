//
//  WebServices.swift
//  GoodNews
//
//  Created by do Nascimento Monteiro, Thiago on 20/10/21.
//

import Foundation
class MyWebService {
    // MARK: - Methods
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                do {
                    let articleList = try JSONDecoder().decode(ArticleList.self, from: data)
                    completion(articleList.articles)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
