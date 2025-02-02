//
//  UIStackView+Subviews.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit

extension UIStackView {
    
    public func addSpacer() {
        self.addArrangedSubview(UIView())
    }
    
    public func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { view in
            view.removeFromSuperview()
            removeArrangedSubview(view)
        }
    }
    
    @discardableResult
    public func addArrangedSubview(_ view: UIView, insets: UIEdgeInsets, backgroundColor: UIColor = .clear) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = backgroundColor
        containerView.addSubviewAndMakeConstraints(view, insets: insets)
        addArrangedSubview(containerView)
        return containerView
    }
    
    public func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
    
    public func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
