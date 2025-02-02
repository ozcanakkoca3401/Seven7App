//
//  UITableView+Layout.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit

extension UITableView {
    public func prepareTableHeaderViewLayout() {
        guard let headerView = tableHeaderView else { return }
        
        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()
        
        let headerSize = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let height = headerSize.height
        var frame = headerView.frame
        
        frame.size.height = height
        headerView.frame = frame
        
        tableHeaderView = headerView
        layoutIfNeeded()
    }
}
