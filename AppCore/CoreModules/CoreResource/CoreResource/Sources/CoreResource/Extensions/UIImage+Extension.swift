//
//  UIImage+Extension.swift
//  
//
//  Created by Ozcan Akkoca on 7.01.2024.
//

import UIKit

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: .module, with: nil) else {
            return UIImage()
        }
        return image
    }
}
