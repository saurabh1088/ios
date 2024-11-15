//
//  Logger+Extension.swift
//  LearningAppStartupUIKit
//
//  Created by Saurabh Verma on 15/11/24.
//

import Foundation
import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier!
}

extension Logger {
    static let appLifeCycle = Logger(subsystem: subsystem, category: "App Lifecycle")
}
