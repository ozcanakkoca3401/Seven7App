//
//  CoreColors.swift
//  
//
//  Created by Ozcan Akkoca on 7.01.2024.
//

import UIKit

public struct CoreColors {
    public static var red7: UIColor { Colors.red7.asUIColor }
    public static var black7: UIColor { Colors.black7.asUIColor }
    public static var border7: UIColor { Colors.border7.asUIColor }
    public static var gray7: UIColor { Colors.gray7.asUIColor }
    public static var lightPurple7: UIColor { Colors.lightPurple7.asUIColor }
    public static var white7: UIColor { Colors.white7.asUIColor }
}

public enum Colors: String {
    case white7
    case red7
    case black7
    case border7
    case gray7
    case lightPurple7
}

extension Colors {
    public var asUIColor: UIColor {
        guard let colorAsset = UIColor(
            named: rawValue,
            in: Bundle.module,
            compatibleWith: nil
        ) else {
            assertionFailure("[CoreResource] No color with \(rawValue) in the color assets")
            return .unknownColor
        }
        return colorAsset
    }

    public var asCGColor: CGColor {
        asUIColor.cgColor
    }
}

/// Define unknown color
extension UIColor {
    static let unknownColor = UIColor.clear
}
