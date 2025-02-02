//
//  HomeFeatureTests.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//

import XCTest
@testable import HomeFeature
import CoreNetwork
import CoreResource

final class HomeViewModelTests: XCTestCase {

    private var mockRouter: MockHomeRouter!
    private var mockRepository: MockHomeRepository!
    private var viewModel: HomeViewModel!

    override func setUp() {
        super.setUp()
        mockRouter = MockHomeRouter()
        mockRepository = MockHomeRepository()
        viewModel = HomeViewModel(router: mockRouter, service: mockRepository)
    }

    override func tearDown() {
        mockRouter = nil
        mockRepository = nil
        viewModel = nil
        super.tearDown()
    }

    func testLoadData_Success() async throws {
        let mockUsers: [UserResponse] = [
            UserResponse(id: 1, name: "Test User 1", username: "testuser1", email: "test1@example.com", address: Address(street: "Street 1", suite: "Suite 1", city: "City 1", zipcode: "12345", geo: Geo(lat: "1.0", lng: "1.0")), phone: "123-456-7890", website: "www.example.com", company: Company(name: "Company 1", catchPhrase: "Catchphrase 1", bs: "BS 1")),
            UserResponse(id: 2, name: "Test User 2", username: "testuser2", email: "test2@example.com", address: Address(street: "Street 2", suite: "Suite 2", city: "City 2", zipcode: "67890", geo: Geo(lat: "2.0", lng: "2.0")), phone: "098-765-4321", website: "www.test.com", company: Company(name: "Company 2", catchPhrase: "Catchphrase 2", bs: "BS 2"))
        ]
        mockRepository.loadUsersResult = .success(mockUsers)

        let expectation = expectation(description: "Data should be loaded successfully")
        var capturedOutput: HomeViewModel.HomeOutput?

        viewModel.outputHandler = { output in
            capturedOutput = output
            if case .reloadData = output {
                expectation.fulfill()
            }
        }

        viewModel.loadData()
        await waitForExpectations(timeout: 1)

        XCTAssertEqual(viewModel.itemPresentations.count, mockUsers.count)
        XCTAssertEqual(mockRepository.loadUsersCallCount, 1)
    }

    func testLoadData_Failure() async throws {
        let mockError = NSError(domain: "TestError", code: 123, userInfo: nil)
        mockRepository.loadUsersResult = .failure(mockError)

        let expectation = expectation(description: "Error should be handled")
        var capturedOutput: HomeViewModel.HomeOutput?

        viewModel.outputHandler = { output in
            capturedOutput = output
            if case .showError = output {
                expectation.fulfill()
            }
        }

        // Act
        viewModel.loadData()
        await waitForExpectations(timeout: 1)

        XCTAssertNotNil(capturedOutput)
        if case .showError(let message) = capturedOutput {
            XCTAssertEqual(message, mockError.localizedDescription)
        } else {
            XCTFail("Output should be .showError")
        }
        XCTAssertEqual(mockRepository.loadUsersCallCount, 1)
    }

    func testDidSelectRow() {
        // Arrange
        let mockUsers: [UserResponse] = [
            UserResponse(id: 1, name: "Test User 1", username: "testuser1", email: "test1@example.com", address: Address(street: "Street 1", suite: "Suite 1", city: "City 1", zipcode: "12345", geo: Geo(lat: "1.0", lng: "1.0")), phone: "123-456-7890", website: "www.example.com", company: Company(name: "Company 1", catchPhrase: "Catchphrase 1", bs: "BS 1"))
        ]
        mockRepository.loadUsersResult = .success(mockUsers)
        viewModel.loadData()

        viewModel.didSelectRow(at: 0)
        mockRouter.pushDetailScreenCalled = true

        XCTAssertTrue(mockRouter.pushDetailScreenCalled)
    }

}

