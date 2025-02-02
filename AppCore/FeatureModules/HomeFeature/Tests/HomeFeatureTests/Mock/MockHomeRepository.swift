//
//  MockHomeRepository.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//

import XCTest
@testable import HomeFeature

final class MockHomeRepository: HomeRepositoryProtocol {
    var loadUsersCallCount = 0
    var loadUsersResult: Result<[UserResponse], Error> = .success([])

    func loadUsers() async throws -> [UserResponse] {
        loadUsersCallCount += 1
        switch loadUsersResult {
        case .success(let users):
            return users
        case .failure(let error):
            throw error
        }
    }
}
