//
//  HttpModel+Endpoint.swift
//  Kumbaram
//
//  Created by Ozcan Akkoca on 6.01.2024.
//

import Foundation
import Alamofire

public extension HttpModel {
        
    struct General {
        public static func getUsers() -> HttpModel {
            return HttpModel(path: "users")
        }
    }
       
}


