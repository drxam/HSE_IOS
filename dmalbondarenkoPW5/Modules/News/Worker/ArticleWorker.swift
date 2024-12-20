//
//  ArticleWorker.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import Foundation

class ArticleWorker: ArticleWorkerProtocol {
    // MARK: - Constants
    private let decoder: JSONDecoder = JSONDecoder()
    
    // MARK: - Variables
    private var newsPage: NewsPage = NewsPage()
    private var padeIndex: Int = Constants.ArticleWorker.padeIndex
    
    // MARK: - Public funcs
    func getData(completion: @escaping ([ArticleModel]) -> Void) {
        padeIndex = Constants.ArticleWorker.padeIndex
        fetchNews { [weak self] in
            completion(self?.newsPage.news ?? [])
        }
    }
    
    func updateData(completion: @escaping ([ArticleModel]) -> Void) {
        padeIndex += 1
        fetchNews { [weak self] in
            completion(self?.newsPage.news ?? [])
        }
    }
    
    // MARK: - Private funcs
    private func getURL(_ rubric: Int, _ pageIndex: Int) -> URL? {
    URL(string: "https://news.myseldon.com/api/Section?rubricId=\(rubric)&pageSize=8&pageIndex=\(pageIndex)")
    }
    
    // MARK: - Fetch news
    private func fetchNews(completion: @escaping () -> Void) {
        guard let url = getURL(4, padeIndex) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print(error)
                completion()
                return
            }
            if
                let self,
                let data = data,
                var newsPage = try? self.decoder.decode(NewsPage.self, from: data)
            {
                DispatchQueue.main.async {
                    newsPage.passTheRequestId()
                    self.newsPage = newsPage
                    completion()
                }
            } else {
                completion()
            }
        }.resume()
    }
}
