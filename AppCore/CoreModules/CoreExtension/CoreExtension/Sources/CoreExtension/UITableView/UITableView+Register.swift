//
//  UITableView+Register.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit

extension UITableView {
    
    public func registerReusableCell<T: UITableViewCell>(_ type: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: type))
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath, type: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: type), for: indexPath) as? T else {
            fatalError("Failed to dequeue cell")
        }
        return cell
    }
}
