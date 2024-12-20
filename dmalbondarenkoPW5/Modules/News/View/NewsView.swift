//
//  NewsView.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import UIKit

class NewsView: UIView {
    // MARK: - Constants
    let tableView = UITableView()
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    private func configureUI() {
        backgroundColor = .darkGray
        configureTableView()
    }
    
    private func configureTableView() {
        addSubview(tableView)
        tableView.backgroundColor = Constants.NewsView.backgroundColor
        tableView.separatorStyle = Constants.NewsView.separatorStyle
        
        tableView.pinHorizontal(to: self, Constants.NewsView.horizontalOffset)
        tableView.pinTop(to: self.topAnchor)
        tableView.pinBottom(to: self.bottomAnchor)
    }
}
