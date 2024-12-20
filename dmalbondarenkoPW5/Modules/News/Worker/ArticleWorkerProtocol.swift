//
//  ArticleWorkerProtocol.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

// от Interactor к Worker

import Foundation

protocol ArticleWorkerProtocol: AnyObject {
    func getData(completion: @escaping ([ArticleModel]) -> Void)
    func updateData(completion: @escaping ([ArticleModel]) -> Void)
}
