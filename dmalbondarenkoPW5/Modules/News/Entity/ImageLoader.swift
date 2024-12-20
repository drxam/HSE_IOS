//
//  ImageLoader.swift
//  dmalbondarenkoPW5
//
//  Created by dread on 17.12.2024.
//

import Foundation
import UIKit

class ImageLoader {
    // MARK: - Constants
    static let shared = ImageLoader()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public funcs
    func loadImage(_ imageURL: ImageContainer, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            guard let url = imageURL.url,
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
