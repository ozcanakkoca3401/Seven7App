//
//  String+QR.swift
//  
//
//  Created by Ozcan Akkoca on 17.01.2024.
//

import UIKit

extension String {
    
    public func generateQRCode() -> UIImage? {
        let data = self.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }
}
