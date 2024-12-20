//
//  ArticleModel.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import Foundation
import UIKit

struct ArticleModel: Decodable {
    var newsId: Int?
    var title: String?
    var announce: String?
    var img: ImageContainer?
    var timeOfReading: String?
    var date: String?
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.ArticleModel.inputStringFormat
        formatter.locale = Locale(identifier: Constants.ArticleModel.locale)
        
        if let date = formatter.date(from: date!) {
            formatter.dateFormat = Constants.ArticleModel.outputStringFormat
            return formatter.string(from: date)
        }
        return self.date!
    }
    var requestId: String?
    var articleUrl: URL? {
        let requestId = requestId ?? ""
        let newsId = newsId ?? 0
        return URL(string: "https://news.myseldon.com/ru/news/index/\(newsId)?requestId=\(requestId)")
    }
}
