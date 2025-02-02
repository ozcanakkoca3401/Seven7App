//
//  Decodable.swift
//  CoreExtension
//
//  Created by Özcan AKKOCA on 31.01.2025.
//

import Foundation

extension Decodable {
    public static func fromJsonString(_ jsonString: String) -> Self? {
        guard let jsonData = jsonString.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(Self.self, from: jsonData)
    }
}
