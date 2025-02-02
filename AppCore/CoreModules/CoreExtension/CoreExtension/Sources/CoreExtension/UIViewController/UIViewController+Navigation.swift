//
//  File.swift
//  
//
//  Created by Ozcan Akkoca on 14.01.2024.
//

import UIKit

extension UIViewController {
    public func hideBackBarButtonTitle() {
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}
