//
//  HomeRepository.swift
//  HomeModule
//
//  Created by Özcan AKKOCA on 28.01.2025.
//
//

import Foundation
import CoreNetwork

protocol HomeRepositoryProtocol: AnyObject {
    func loadUsers() async throws -> [UserResponse]
}

final class HomeRepository: BaseRepository, HomeRepositoryProtocol {
    
    func loadUsers() async throws -> [UserResponse] {
        return try await service.fetchData(model: HttpModel.General.getUsers())
    }
}
