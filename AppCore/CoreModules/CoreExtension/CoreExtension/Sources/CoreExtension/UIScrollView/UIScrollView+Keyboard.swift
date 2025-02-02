//
//  UIScrollView+Keyboard.swift
//  
//
//  Created by Ozcan Akkoca on 19.01.2024.
//

import UIKit

extension UIScrollView {
    public func prepareNotificationCenter() {
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        guard var keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue else {
            return
        }
        keyboardFrame = convert(keyboardFrame, from: nil)

        let bottomInset: CGFloat
        let keyboardIntersectionRect = bounds.intersection(keyboardFrame)

        if !keyboardIntersectionRect.isNull {
            bottomInset = keyboardIntersectionRect.height
            let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomInset, right: 0)
            self.contentInset = contentInset
            scrollIndicatorInsets = contentInset
        } else {
            bottomInset = 0.0
        }

        guard let firstResponder = firstResponder else {
            return
        }

        let firstResponderFrame = firstResponder.convert(firstResponder.bounds, to: self)
        let responderOrigin = CGPoint(x: firstResponderFrame.origin.x, y: firstResponderFrame.origin.y + firstResponderFrame.height)

        var contentBounds = CGRect(origin: contentOffset, size: bounds.size)
        contentBounds.size.height -= bottomInset

        if !contentBounds.contains(responderOrigin) {
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.25
            let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UIView.AnimationCurve ?? UIView.AnimationCurve.easeInOut

            UIView.beginAnimations("AutoscrollAnimation", context: nil)
            UIView.setAnimationCurve(curve)
            UIView.setAnimationDuration(duration)
            scrollRectToVisible(firstResponderFrame, animated: false)
            UIView.commitAnimations()
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        self.contentInset = UIEdgeInsets.zero
        scrollIndicatorInsets = UIEdgeInsets.zero
    }
}

private extension UIView {
    var firstResponder: UIView? {
        if isFirstResponder {
            return self
        }
        for subview in subviews {
            if let responder = subview.firstResponder {
                return responder
            }
        }
        return nil
    }
}
