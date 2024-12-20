//
//  NewsInteractor.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import Foundation

class NewsInteractor: NewsBuisnessLogic, NewsDataStore {
    // MARK: - Variables
    var presenter: NewsPresentationLogic!
    var worker: ArticleWorkerProtocol!
    
    var articles: [ArticleModel] = [] {
        didSet {
            presenter.presentNews()
        }
    }
    
    // MARK: - Public funcs
    func loadFreshNews() {
        worker.getData { [weak self] articles in
            self?.articles = articles
        }
    }

    func loadMoreNews() {
        worker.updateData { [weak self] articles in
            self?.articles += articles
        }
    }
}
