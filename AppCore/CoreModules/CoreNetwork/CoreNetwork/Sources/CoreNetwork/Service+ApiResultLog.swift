//
//  Service+ApiResultLog.swift
//  Kumbaram
//
//  Created by Ozcan Akkoca on 6.01.2024.
//

import Foundation
import Alamofire
import Combine

extension Service {
    func logAPIResponse<T>(dataResponse: DataResponse<T, AFError>) {
        if let request = dataResponse.request {
            print("\n📍📍📍📍📍📍📍📍📍📍📍📍📍📍📍📍📍📍📍📍📍📍📍\n")
            print("\n🎩 HTTP Request Headers: 🎩 \(request.allHTTPHeaderFields ?? [:])")
            if let body = request.httpBody, let string = String(data: body, encoding: String.Encoding.utf8) {
                print("\nHTTP Request Body: \(string)")
            }
            
            if let response = dataResponse.response {
                let statusCode = response.statusCode
                var statusCodeIcon = "💔"
                if statusCode >= 200 && statusCode < 300 {
                    statusCodeIcon = "✅"
                }
                
                print("\n\(statusCodeIcon) HTTP Status Code: \(statusCodeIcon) \(statusCode)")
                print("\n📝 HTTP Response Headers: 📝 \(response.allHeaderFields)")
            } else {
                print("\n☢️ Internet Connection Required ☢️")
            }
            
            print("\n📭 HTTP Request URL: 📭 \(request.url!.absoluteString)")
            
            switch dataResponse.result {
            case .success(let result):
                if result is NSNull  {
                    return
                }
                if let data = try? JSONSerialization.data(withJSONObject: result, options: .prettyPrinted),
                   let text = String(data: data, encoding: .utf8) {
                    print("\n📌 HTTP Response Body: 📌 \n \(text)")
                }
            case .failure:
                print("\n📌 HTTP Response Body: 📌 \n \(dataResponse.result) \n")
                if let responseData = dataResponse.data, let htmlString = String(data: responseData, encoding: .utf8) {
                    print(htmlString)
                }
            }
            print("\n🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁🏁\n\n")
        }
    }
    
}

