//
//  DetailRouter.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: - RoutingProtocol
protocol DetailRouterProtocol: AnyObject {
    func openURL(_ urlString: String)
}

// MARK: - Router
final class DetailRouter {
    private weak var moduleViewController: MVVMDetailViewController?
    private let initialData: DetailInitialData
    
    init(initialData: DetailInitialData) {
        self.initialData = initialData
    }
}

extension DetailRouter {
    func start() -> MVVMDetailViewController {
        let viewController = initModule()
        self.moduleViewController = viewController
        return viewController
    }
    
    private func initModule() -> MVVMDetailViewController {
        let viewController = MVVMDetailViewController()
        let viewModel = DetailViewModel(router: self, initialData: initialData)
        viewController.viewModel = viewModel
        return viewController
    }
}

// MARK: - DetailRouterProtocol
extension DetailRouter: DetailRouterProtocol {
    func openURL(_ urlString: String) {
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
