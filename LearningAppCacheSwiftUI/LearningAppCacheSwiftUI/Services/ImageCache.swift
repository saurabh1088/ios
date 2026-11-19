//
//  ImageCache.swift
//  LearningAppCacheSwiftUI
//
//  Created by Saurabh Verma on 18/11/26.
//

import Foundation
import UIKit

final class ImageCache: NSObject, NSCacheDelegate {

    // MARK: - Properties

    private let cache = NSCache<NSString, UIImage>()

    // MARK: - Initialization

    override init() {
        super.init()
        
        cache.name = "com.cachelab.imagecache"
        cache.countLimit = 10
        cache.totalCostLimit = 50 * 1024 * 1024 // 50 MB
        
        cache.delegate = self
    }

    // MARK: - Cache Operations

    func insert(_ image: UIImage, forKey key: String) {

        let cost = imageCost(image)

        cache.setObject(
            image,
            forKey: key as NSString,
            cost: cost
        )
    }

    func image(forKey key: String) -> UIImage? {

        cache.object(forKey: key as NSString)
    }

    func removeImage(forKey key: String) {

        cache.removeObject(forKey: key as NSString)
    }

    func clearCache() {

        cache.removeAllObjects()
    }

    // MARK: - Cost Calculation

    private func imageCost(_ image: UIImage) -> Int {

        guard let cgImage = image.cgImage else {
            return 0
        }

        return cgImage.bytesPerRow * cgImage.height
    }
}

// MARK: ImageCache NSCacheDelegate conformation
extension ImageCache {
    
    func cache(_ cache: NSCache<AnyObject, AnyObject>, willEvictObject obj: Any) {
        print("NSCache evicted an object:", obj)
    }
}

