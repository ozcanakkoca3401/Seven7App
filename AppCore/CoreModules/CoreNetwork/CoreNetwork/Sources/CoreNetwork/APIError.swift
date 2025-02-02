//
//  APIError.swift
//  Kumbaram
//
//  Created by Ozcan Akkoca on 6.01.2024.
//

import Foundation

public enum APIError: Error {
    case generic(_ error: ServiceError?, statusCode: Int?)
    case tokenError
}

public struct ServiceError: Decodable {
    public let errorKey: String?
    public let type: String?
    public let title: String?
    public let message: String?
    public let status: Int?
}


