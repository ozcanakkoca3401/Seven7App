//
//  UIView+LayoutIfNeeded.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit

extension UIView {
    public func layoutIfNeededAnimated(duration: CFTimeInterval = 0.08) {
        UIView.animate(withDuration: duration, delay: 0, options: UIView.AnimationOptions(), animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
}


