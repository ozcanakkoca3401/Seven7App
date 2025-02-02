//
//  UIView+Subviews.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit
import SnapKit
extension UIView {
    
    public func addSubviewAndMakeConstraints(_ view: UIView, horizontal: CGFloat, vertical: CGFloat) {
       addSubviewAndMakeConstraints(view, insets: UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal))
    }
    
    public func addSubviewAndMakeConstraints(_ view: UIView, insets: UIEdgeInsets? = nil) {
        addSubview(view)
        if let insets = insets {
            view.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(insets.top)
                make.bottom.equalToSuperview().inset(insets.bottom)
                make.leading.equalToSuperview().inset(insets.left)
                make.trailing.equalToSuperview().inset(insets.right)
            }
        } else {
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
    
    public func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    public func setSuperview(isHidden: Bool) {
        superview?.isHidden = isHidden
    }
}

