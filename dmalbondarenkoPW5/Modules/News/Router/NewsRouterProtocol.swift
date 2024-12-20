//
//  NewsRouterProtocol.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

import Foundation

protocol NewsRouterProtocol: AnyObject {
    func showNewScreen(url: URL)
    func showShareScreen(url: URL)
}
