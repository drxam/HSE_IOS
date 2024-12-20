//
//  NewsPage.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import Foundation

struct NewsPage: Decodable {
    var news: [ArticleModel]?
    var requestId: String?
    mutating func passTheRequestId() {
        for i in 0..<(news?.count ?? 0) {
            news?[i].requestId = requestId
        }
    }
}
