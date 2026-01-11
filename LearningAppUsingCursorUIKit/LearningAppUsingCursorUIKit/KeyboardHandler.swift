//
//  KeyboardHandler.swift
//  LearningAppUsingCursorUIKit
//
//  Created by Saurabh Verma on 11/12/25.
//

import UIKit

/// Protocol for view controllers that need keyboard handling functionality
protocol KeyboardHandling: AnyObject {
    func getScrollView() -> UIScrollView?
    func setupKeyboardHandling()
    func removeKeyboardHandling()
}

extension KeyboardHandling where Self: UIViewController {
    
    /// Handles keyboard will show notification
    /// This method contains the reusable logic for keyboard handling
    func handleKeyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let scrollView = getScrollView() else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }
    
    /// Handles keyboard will hide notification
    /// This method contains the reusable logic for keyboard handling
    func handleKeyboardWillHide(_ notification: Notification) {
        guard let scrollView = getScrollView() else {
            return
        }
        
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
}
