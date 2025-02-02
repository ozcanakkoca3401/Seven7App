//
//  UITableView+Helper.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit

extension UITableView {
    public func selectAllRows() {
        let totalRows = self.numberOfRows(inSection: 0)
        for row in 0..<totalRows {
            self.selectRow(at: IndexPath(row: row, section: 0), animated: true, scrollPosition: .none)
        }
    }
}
