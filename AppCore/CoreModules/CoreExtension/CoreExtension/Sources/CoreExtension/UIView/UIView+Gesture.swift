//
//  UIView+Gesture.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit

extension UIView {
    public func addTapGestureRecognizer(target: Any?, action: Selector?) {
        isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tapGestureRecognizer)
    }
}
