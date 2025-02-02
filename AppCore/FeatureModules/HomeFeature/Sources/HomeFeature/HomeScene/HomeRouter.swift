//
//  HomeRouter.swift
//  HomeModule
//
//  Created by Özcan AKKOCA on 28.01.2025.
//
//

import UIKit

// MARK: - RoutingProtocol
protocol HomeRouterProtocol: AnyObject {
    func pushDetailScreen(initialData: DetailInitialData)
}

// MARK: - Router
public final class HomeRouter {
    
    private weak var moduleViewController: MVVMHomeViewController?

    public init () {}
}

extension HomeRouter {
    public func start()  -> MVVMHomeViewController {
        let viewController = initModule()
        self.moduleViewController = viewController
        return viewController
    }
    
    private func initModule() -> MVVMHomeViewController {
        let viewController = MVVMHomeViewController()
        let viewModel = HomeViewModel(router: self, service: HomeRepository())
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - HomeRouterProtocol
extension HomeRouter: HomeRouterProtocol {
    func pushDetailScreen(initialData: DetailInitialData) {
        let vc = DetailRouter(initialData: initialData).start()
        moduleViewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
