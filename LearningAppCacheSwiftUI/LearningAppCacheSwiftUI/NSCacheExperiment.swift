//
//  NSCacheExperiment.swift
//  LearningAppCacheSwiftUI
//
//  Created by Saurabh Verma on 19/11/26.
//

import Foundation
import UIKit

func runNSCacheExperiment() {

    let cache = NSCache<NSString, NSString>()

    cache.countLimit = 3

    cache.setObject("Apple", forKey: "1")
    cache.setObject("Orange", forKey: "2")
    cache.setObject("Mango", forKey: "3")

    print("First retrieval:",
          cache.object(forKey: "1") ?? "Not found")

    cache.setObject("Banana", forKey: "4")

    print("Second retrieval:",
          cache.object(forKey: "1") ?? "Not found")

    print("Third retrieval:",
          cache.object(forKey: "4") ?? "Not found")
}
