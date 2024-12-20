//
//  WebViewController.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 15.12.2024.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    // MARK: - Variables
    var webView = WKWebView()
    var url: URL?
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
    }
    
    // MARK: - Private funcs
    private func configureWebView() {
        webView.load(URLRequest(url: url!))
    }
}
