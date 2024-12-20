//
//  Constants.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 17.12.2024.
//

import Foundation
import UIKit

enum Constants {
    enum ArticleWorker {
        static let padeIndex: Int = 1
    }
    
    enum ArticleModel {
        static let inputStringFormat: String = "yyyy-MM-dd'T'HH:mm:ss"
        static let locale: String = "en_US_POSIX"
        static let outputStringFormat: String = "dd/MM/yyyy HH:mm"
    }
    
    enum NewsViewController {
        static let navigationTitle: String = "Новости"
    }
    
    enum NewsView {
        static let backgroundColor: UIColor = .clear
        static let separatorStyle: UITableViewCell.SeparatorStyle = .none
        static let horizontalOffset: CGFloat = 5
    }
    
    enum UITableViewDelegate {
        static let heightForRowAt: CGFloat = 300
        static let scrollOffset: CGFloat = 100
        static let shareTitle: String = "Поделиться"
    }
    
    enum ArticleCell {
        static let reuseId: String = "ArticleCell"
        static let imageCornerRadius: CGFloat = 10
        static let imagePin: CGFloat = 5
        
        static let descriptionFont: UIFont = .systemFont(ofSize: 12)
        static let descriptionHorizontalOffset: CGFloat = 3
        static let descriptionBottomOffset: CGFloat = 2
        static let descriptionHeight: CGFloat = 60
        static let descriptionTextColor: UIColor = .white
        static let descriptionLineBreakMode: NSLineBreakMode = .byTruncatingTail
        
        static let titleFont: UIFont = UIFont.boldSystemFont(ofSize: 14)
        static let titleHorizontalOffset: CGFloat = 3
        static let titleHeight: CGFloat = 40
        static let titleTextColor: UIColor = .green
        static let titleLineBreakMode: NSLineBreakMode = .byWordWrapping
        
        static let timeBackgroundColor: UIColor = .darkGray
        static let timeCornerRadius: CGFloat = 10
        static let timeTopOffset: CGFloat = 5
        static let timeRightOffset: CGFloat = 5
        static let timeHeight: CGFloat = 20
        static let timeWidth: CGFloat = 55
        static let timeFont: UIFont = UIFont.systemFont(ofSize: 12)
        static let timeTextColor: UIColor = .green
        
        static let dateBackgroundColor: UIColor = .darkGray
        static let dateCornerRadius: CGFloat = 10
        static let dateTopOffset: CGFloat = 5
        static let dateLeftOffset: CGFloat = 5
        static let dateHeight: CGFloat = 20
        static let dateWidth: CGFloat = 120
        static let dateFont: UIFont = UIFont.systemFont(ofSize: 12)
        static let dateTextColor: UIColor = .green
        
        static let gradientColors: [CGColor] = [UIColor.clear.cgColor, UIColor.black.cgColor]
        static let gradientLocations: [NSNumber] = [0.0, 1.0]
    }
}
