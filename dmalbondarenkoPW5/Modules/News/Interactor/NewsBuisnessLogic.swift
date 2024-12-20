//
//  NewsBuisnessLogic.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 14.12.2024.
//

// от ViewController к Interactor

import Foundation

protocol NewsBuisnessLogic: AnyObject {
    func loadFreshNews()
    func loadMoreNews()
}
