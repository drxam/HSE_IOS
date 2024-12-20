//
//  NewsViewController+UITableViewDataSource.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import Foundation
import UIKit

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.articles.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseId, for: indexPath)
        guard let articleCell = cell as? ArticleCell else { return cell }
        
        articleCell.configure(interactor.articles[indexPath.row])
        
        return articleCell
    }
}
