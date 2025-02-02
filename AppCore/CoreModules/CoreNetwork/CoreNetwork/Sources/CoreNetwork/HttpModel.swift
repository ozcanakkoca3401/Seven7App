//
//  HttpModel.swift
//  Kumbaram
//
//  Created by Ozcan Akkoca on 6.01.2024.
//

import Foundation
import Alamofire

public struct HttpModel {
    let method: HTTPMethod
    let path: String
    let headers: HTTPHeaders
    let parameters: Parameters?
    let encoding: ParameterEncoding
    let shouldShowPopupOnError: Bool
    
    init(method: HTTPMethod = .get,
         path: String,
         headers: HTTPHeaders = .defaultHeader,
         parameters: Parameters? = nil,
         encoding: ParameterEncoding = JSONEncoding.default,
         shouldShowPopupOnError: Bool = true) {
        self.method = method
        self.path = Endpoint.production.rawValue + path
        self.headers = headers
        self.parameters = parameters
        self.encoding = encoding
        self.shouldShowPopupOnError = shouldShowPopupOnError
    }
}

extension Alamofire.HTTPHeaders {
    static var defaultHeader: HTTPHeaders {
        HTTPHeaders([:])
    }
}


