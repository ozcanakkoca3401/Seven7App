//
//  File.swift
//  
//
//  Created by Ozcan Akkoca on 19.01.2024.
//

import UIKit

extension UITextField {
    public func addCloseToolbar(title: String = "Kapat") {
        let bar = UIToolbar()
        let closeButton = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(self.endEditing(_:)))
        closeButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        let spacingButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        bar.items = [spacingButton,closeButton]
        bar.sizeToFit()
        inputAccessoryView = bar
    }
}
