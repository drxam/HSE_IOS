//
//  NewsAssembly.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 15.12.2024.
//

import Foundation
import UIKit

class NewsAssembly: NSObject {
    weak var viewController: UIViewController!
    
    class func configureModule() -> UIViewController {
        let view = NewsViewController()
        
        let presenter = NewsPresenter()
        let interactor = NewsInteractor()
        let router = NewsRouter()
        let worker = ArticleWorker()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        interactor.worker = worker
        
        router.view = view
        
        presenter.view = view
        
        return view
    }
}
