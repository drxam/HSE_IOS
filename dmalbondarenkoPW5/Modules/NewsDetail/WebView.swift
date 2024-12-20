//
//  WebView.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 17.12.2024.
//

import UIKit
import WebKit

class WebView: UIView {
    // MARK: - Variables
    private var webView = WKWebView()
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public funcs
    func load(_ request: URLRequest) {
        webView.load(request)
    }
    
    // MARK: - Private funcs
    private func configure() {
        addSubview(webView)
        webView.pinHorizontal(to: self)
        webView.pinTop(to: self.safeAreaLayoutGuide.topAnchor)
        webView.pinBottom(to: self.safeAreaLayoutGuide.bottomAnchor)
    }
}
