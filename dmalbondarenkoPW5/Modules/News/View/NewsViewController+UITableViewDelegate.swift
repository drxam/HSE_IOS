//
//  NewsViewController+UITableViewDelegate.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import Foundation
import UIKit

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.showNewScreen(url: interactor.articles[indexPath.row].articleUrl!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.UITableViewDelegate.heightForRowAt
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentHeight = scrollView.contentSize.height
        let offsetY = scrollView.contentOffset.y
        let height = scrollView.frame.size.height
        
        if offsetY + height >= contentHeight - Constants.UITableViewDelegate.scrollOffset {
            interactor?.loadMoreNews()
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let shareAction = UIContextualAction(style: .normal, title: Constants.UITableViewDelegate.shareTitle) { [weak self] _, _, _ in
            guard let self = self,
                  let url = self.interactor.articles[indexPath.row].articleUrl else {
                return
            }
            router.showShareScreen(url: url)
        }
        shareAction.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [shareAction])
    }
}
