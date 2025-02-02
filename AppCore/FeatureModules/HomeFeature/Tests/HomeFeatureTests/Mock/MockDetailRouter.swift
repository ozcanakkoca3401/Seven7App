//
//  MockDetailRouter.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//

import XCTest
@testable import HomeFeature

final class MockDetailRouter: DetailRouterProtocol {
    private(set) var openedURL: String?

    func openURL(_ urlString: String) {
        openedURL = urlString
    }
}
