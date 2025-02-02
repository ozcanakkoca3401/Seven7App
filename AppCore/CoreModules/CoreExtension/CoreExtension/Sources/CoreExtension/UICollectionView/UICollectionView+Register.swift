//
//  UICollectionView+Register.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit

extension UICollectionView {
    
    public func registerReuseableCell<T: UICollectionViewCell>(_ type: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: type))
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(_ indexPath: IndexPath, type: T.Type) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as? T else {
            fatalError("Failed to dequeue cell")
        }
        return cell
    }
}

extension UICollectionView {
    
    public func reloadData(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
}
