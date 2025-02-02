//
//  UIImage+Utility.swift
//  
//
//  Created by Özcan AKKOCA on 28.01.2025.
//

import UIKit

extension UIImage {
    public static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName) else {
            return UIImage()
        }
        return image
    }
}
