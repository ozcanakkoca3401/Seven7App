//
//  DetailViewModelTests.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//

import XCTest
@testable import HomeFeature

final class DetailViewModelTests: XCTestCase {
    
    private var viewModel: DetailViewModel!
    private var mockRouter: MockDetailRouter!
    private var testInitialData: DetailInitialData!
    
    override func setUp() {
        super.setUp()
        
        mockRouter = MockDetailRouter()
        
        let userResponse = UserResponse(
            id: 1,
            name: "John Doe",
            username: "johndoe",
            email: "john@example.com",
            address: Address(
                street: "Test St.",
                suite: "Apt 1",
                city: "Test City",
                zipcode: "12345",
                geo: Geo(lat: "123", lng: "123")
            ), phone: "1234567890",
            website: "example.com",
            company: Company(name: "Seven", catchPhrase: "AA", bs: "Detail")
        )
        testInitialData = DetailInitialData(with: userResponse)
        
        viewModel = DetailViewModel(router: mockRouter, initialData: testInitialData)
    }
    
    override func tearDown() {
        viewModel = nil
        mockRouter = nil
        testInitialData = nil
        super.tearDown()
    }

    // MARK: - Output Tests
    
    func test_loadData_ShouldTriggerCorrectOutputs() {
        let expectation1 = expectation(description: "Title should be set")
        let expectation2 = expectation(description: "Detail should be prepared")
        
        viewModel.outputHandler = { output in
            switch output {
            case .setTitle(let title):
                XCTAssertEqual(title, "johndoe")
                expectation1.fulfill()
            case .prepareDetail(let presentation):
                XCTAssertEqual(presentation.shortName, "JD")
                expectation2.fulfill()
            }
        }
        
        viewModel.loadData()
        
        wait(for: [expectation1, expectation2], timeout: 1.0)
    }
    
    // MARK: - Navigation Tests
    
    func test_emailTapped_ShouldCallRouterWithCorrectURL() {
        viewModel.emailTapped()
        XCTAssertEqual(mockRouter.openedURL, "mailto:john@example.com")
    }

    func test_phoneTapped_ShouldCallRouterWithCorrectURL() {
        viewModel.phoneTapped()
        XCTAssertEqual(mockRouter.openedURL, "tel://1234567890")
    }
    
    func test_websiteTapped_ShouldCallRouterWithCorrectURL() {
        viewModel.websiteTapped()
        XCTAssertEqual(mockRouter.openedURL, "https://example.com")
    }
}
