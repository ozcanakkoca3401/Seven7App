//
//  Service.swift
//  Kumbaram
//
//  Created by Ozcan Akkoca on 6.01.2024.
//

import Alamofire
import Foundation

public class Service: ServiceProtocol {
    public init()  {}
    
    public func fetchData<T: Decodable>(model: HttpModel) async throws -> T {
        
        guard let url = URL(string: model.path),
              let encodedURL = url.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let finalURL = URL(string: encodedURL) else {
            throw APIError.generic(nil, statusCode: nil)
        }
        
        
        let response = await AF.request(finalURL,
                                        method: model.method,
                                        parameters: model.parameters,
                                        encoding: model.encoding,
                                        headers: model.headers)
            .validate()
            .serializingDecodable(T.self)
            .response

            //    logAPIResponse(dataResponse: response)
        
        switch response.result {
        case .success(let data):
            return data
        case .failure(let error):
            throw error
        }
    }
    
}
