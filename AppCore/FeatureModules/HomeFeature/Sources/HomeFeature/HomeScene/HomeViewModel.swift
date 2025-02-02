//
//  HomeViewModel.swift
//  HomeModule
//
//  Created by Özcan AKKOCA on 28.01.2025.
//
//

import Foundation
import CoreNetwork

protocol HomeViewModelProtocol: AnyObject {
    // Add your custom methods here
    func loadData()
    func didSelectRow(at index: Int)
    var outputHandler: ((HomeViewModel.HomeOutput) -> Void)? { set get }
    var itemPresentations: [UserTableViewCellPresentation] { get }
}

final class HomeViewModel {
    
    enum HomeOutput {
        case setLoading(_ isLoading: Bool)
        case showError(_ message: String)
        case reloadData
    }
    
    var outputHandler: ((HomeOutput) -> Void)?
    var itemPresentations: [UserTableViewCellPresentation] = .emptyValue
    
    private var usersReponse: [UserResponse] = .emptyValue

    private let router: HomeRouterProtocol
    private let service: HomeRepositoryProtocol
    
    init(router: HomeRouterProtocol,
         service: HomeRepositoryProtocol) {
        self.router = router
        self.service = service
    }
}

// MARK: - HomeViewModelProtocol
extension HomeViewModel: HomeViewModelProtocol {
    func loadData() {
        outputHandler?(.setLoading(true))
        Task {
            do {
                defer { outputHandler?(.setLoading(false)) }

                let users = try await service.loadUsers()
                
                usersReponse = users
                itemPresentations = users.map { .init(with: $0) }
                outputHandler?(.reloadData)
            } catch {
                outputHandler?(.showError(error.localizedDescription))
            }
        }
    }
    
    func didSelectRow(at index: Int) {
        guard index < usersReponse.count else { return }
        
        let initialData = DetailInitialData(with: usersReponse[index])
        router.pushDetailScreen(initialData: initialData)
    }
}

