//
//  CoreFont.swift
//  
//
//  Created by Ozcan Akkoca on 7.01.2024.
//

import UIKit

extension UIFont {    
    public class func regular(_ size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    public class func bold(_ size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }
}
