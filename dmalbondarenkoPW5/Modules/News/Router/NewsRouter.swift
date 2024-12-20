//
//  NewsRouter.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import Foundation
import UIKit

class NewsRouter: NewsRouterProtocol {
    // MARK: - Variables
    weak var view: UIViewController!
    
    // MARK: - Public funcs
    func showNewScreen(url: URL) {
        let webView = WebViewController()
        webView.url = url
        view.navigationController?.pushViewController(webView, animated: true)
    }
    
    func showShareScreen(url: URL) {
        let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        view.present(activityController, animated: true)
    }
}
