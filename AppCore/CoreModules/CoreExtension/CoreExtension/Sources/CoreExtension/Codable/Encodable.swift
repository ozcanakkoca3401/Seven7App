//
//  Encodable.swift
//  CoreExtension
//
//  Created by Özcan AKKOCA on 31.01.2025.
//

import Foundation

extension Encodable {
    public func toJsonString() -> String? {
        guard let jsonData = try? JSONEncoder().encode(self) else {
            return nil
        }
        return String(data: jsonData, encoding: .utf8)
    }
}
