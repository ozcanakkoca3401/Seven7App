//
//  MockHomeRouter.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//

import XCTest
@testable import HomeFeature

final class MockHomeRouter: HomeRouterProtocol {
    var pushDetailScreenCalled = false
    var pushDetailScreenInitialData: DetailInitialData?

    func pushDetailScreen(initialData: DetailInitialData) {
        pushDetailScreenCalled = true
        pushDetailScreenInitialData = initialData
    }
}

