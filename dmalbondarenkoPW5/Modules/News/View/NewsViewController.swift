//
//  NewsViewController.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import UIKit

class NewsViewController: UIViewController, NewsDisplayProtocol {
    // MARK: - Constants
    let refresh = UIRefreshControl()
    
    // MARK: - Variables
    var newsView = NewsView()
    var interactor: (NewsBuisnessLogic & NewsDataStore)!
    var router: NewsRouterProtocol!
    
    // MARK: - Lifecycle
    override func loadView() {
        view = newsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.loadFreshNews()
        configure()
    }
    
    // MARK: - Public funcs
    func displayNews() {
        newsView.tableView.reloadData()
    }
    
    // MARK: - Private funcs
    private func configure() {
        configureTableView()
        configureRefresh()
        self.navigationItem.title = Constants.NewsViewController.navigationTitle
    }
    
    private func configureTableView() {
        newsView.tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.reuseId)
        newsView.tableView.delegate = self
        newsView.tableView.dataSource = self
    }
    
    private func configureRefresh() {
        refresh.tintColor = .green
        refresh.addTarget(self, action: #selector(updateNews), for: .valueChanged)
        newsView.tableView.addSubview(refresh)
        newsView.tableView.refreshControl = refresh
    }
        
    @objc private func updateNews() {
        interactor.loadFreshNews()
        refresh.endRefreshing()
    }
}
