//
//  ApiModel+Extension.swift
//  Kumbaram
//
//  Created by Ozcan Akkoca on 6.01.2024.
//

import Foundation
import Alamofire

extension URLEncoding {
    static var customQueryString: URLEncoding {
        return URLEncoding(destination: .queryString, boolEncoding: .literal)
    }
}

extension Encodable {
  public var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
