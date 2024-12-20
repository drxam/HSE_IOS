//
//  NewsPresenter.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import Foundation

class NewsPresenter: NewsPresentationLogic {
    // MARK: - Variables
    weak var view: NewsDisplayProtocol!
    
    // MARK: - Public funcs
    func presentNews() {
        self.view.displayNews()
    }
}
