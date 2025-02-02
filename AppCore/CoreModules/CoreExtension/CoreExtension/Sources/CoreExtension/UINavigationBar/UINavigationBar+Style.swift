//
//  UINavigationBar+Style.swift
//  CoreExtension
//
//  Created by Özcan AKKOCA on 29.01.2025.
//


import UIKit

extension UINavigationBar {
     public func applyCustomStyle(
        backgroundColor: UIColor = .white,
        titleColor: UIColor = .black,
        tintColor: UIColor = .black
    ) {
        let textAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = textAttributes
        appearance.largeTitleTextAttributes = textAttributes
        
        standardAppearance = appearance
        scrollEdgeAppearance = appearance
        compactAppearance = appearance
        
        self.tintColor = tintColor
        barTintColor = backgroundColor
    }
}
