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
    
    /// Sets up keyboard notification observers
    func setupKeyboardHandling() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    /// Removes keyboard notification observers
    func removeKeyboardHandling() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let scrollView = getScrollView() else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        scrollView.contentInset.bottom = keyboardHeight
        scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let scrollView = getScrollView() else {
            return
        }
        
        scrollView.contentInset.bottom = 0
        scrollView.verticalScrollIndicatorInsets.bottom = 0
    }
}
