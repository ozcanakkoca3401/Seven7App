//
//  UIView+Utility.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit

extension UIView {
    public func makeCircular() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = self.frame.width / 2
            self.layer.masksToBounds = true
        }
    }
}
