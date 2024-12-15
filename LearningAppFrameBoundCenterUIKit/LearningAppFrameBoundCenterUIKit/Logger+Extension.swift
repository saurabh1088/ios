//
//  Logger+Extension.swift
//  LearningAppFrameBoundCenterUIKit
//
//  Created by Saurabh Verma on 14/12/24.
//

import Foundation
import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier!
}

extension Logger {
    static let viewFrame = Logger(subsystem: subsystem, category: "ViewFrame")
    static let viewBounds = Logger(subsystem: subsystem, category: "ViewBounds")
    static let viewCenter = Logger(subsystem: subsystem, category: "ViewCenter")
}

extension Logger {
    static let storyboardSegueUnwind = Logger(subsystem: subsystem, category: "unwind segue")
}
