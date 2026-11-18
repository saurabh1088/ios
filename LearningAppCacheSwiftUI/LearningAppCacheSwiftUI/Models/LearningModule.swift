//
//  LearningModule.swift
//  LearningAppCacheSwiftUI
//
//  Created by Saurabh Verma on 18/11/26.
//

import Foundation

struct LearningModule: Identifiable {
    let id: Int
    let title: String
    let subtitle: String
    let systemImage: String
    let duration: String

    static let all: [LearningModule] = [
        LearningModule(
            id: 1,
            title: "NSCache Fundamentals",
            subtitle: "Understand in-memory object caching",
            systemImage: "memorychip",
            duration: "20 min"
        ),
        LearningModule(
            id: 2,
            title: "URLCache Fundamentals",
            subtitle: "Understand HTTP response caching",
            systemImage: "network",
            duration: "25 min"
        ),
        LearningModule(
            id: 3,
            title: "NSCache vs URLCache",
            subtitle: "Compare both caching mechanisms",
            systemImage: "arrow.left.arrow.right",
            duration: "15 min"
        ),
        LearningModule(
            id: 4,
            title: "Cache Playground",
            subtitle: "Experiment with caching behaviour",
            systemImage: "slider.horizontal.3",
            duration: "30 min"
        ),
        LearningModule(
            id: 5,
            title: "Interview Challenges",
            subtitle: "Test your caching knowledge",
            systemImage: "terminal",
            duration: "20 min"
        )
    ]
}

