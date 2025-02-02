//
//  UIViewController+Child.swift
//  
//
//  Created by Ozcan Akkoca on 11.01.2024.
//

import UIKit

extension UIViewController {
    public func add(_ child: UIViewController, to containerView: UIView? = nil) {
        addChild(child)
        if let containerView = containerView {
            containerView.addSubview(child.view)
            child.view.frame = containerView.bounds
        } else {
            view.addSubview(child.view)
            child.view.frame = view.bounds
        }
        child.didMove(toParent: self)
    }

    public func remove(from containerView: UIView? = nil) {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        if let containerView = containerView {
            containerView.removeFromSuperview()
        } else {
            view.removeFromSuperview()
        }
        removeFromParent()
    }
}
