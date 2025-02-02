//
//  ServiceProtocol.swift
//  Kumbaram
//
//  Created by Ozcan Akkoca on 6.01.2024.
//

import Combine
import Foundation
import Alamofire
 
public protocol ServiceProtocol {
    func fetchData<T: Decodable>(model: HttpModel) async throws -> T
}

open class BaseRepository {
    public let service: ServiceProtocol
    
    public init(service: ServiceProtocol = Service()) {
        self.service = service
    }
}
