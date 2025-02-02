//
//  String+Combine.swift
//  CoreExtension
//
//  Created by Özcan AKKOCA on 2.02.2025.
//


import UIKit

extension NSAttributedString {
    static public func combined(title: String, description: String, descriptionColor: UIColor = .black) -> NSAttributedString {
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor: UIColor.black
        ]
        let attributedTitle = NSAttributedString(string: "\(title): ", attributes: titleAttributes)

        let descriptionAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: descriptionColor
        ]
        let attributedDescription = NSAttributedString(string: description, attributes: descriptionAttributes)

        let combinedAttributedString = NSMutableAttributedString()
        combinedAttributedString.append(attributedTitle)
        combinedAttributedString.append(attributedDescription)

        return combinedAttributedString
    }
}
