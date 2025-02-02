//
//  DetailViewModel.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    func loadData()
    func emailTapped()
    func phoneTapped()
    func websiteTapped()
    
    var outputHandler: ((DetailViewModel.DetailOutput) -> Void)? { set get }
}

final class DetailViewModel {
    
    enum DetailOutput {
        case setTitle(_ title: String)
        case prepareDetail(_ presentation: DetailViewPresentation)
    }
    
    var outputHandler: ((DetailOutput) -> Void)?

    private let router: DetailRouterProtocol
    private let initialData: DetailInitialData

    init(router: DetailRouterProtocol, initialData: DetailInitialData) {
        self.router = router
        self.initialData = initialData
    }
}

// MARK: - DetailViewModelProtocol
extension DetailViewModel: DetailViewModelProtocol {
    func loadData() {
        outputHandler?(.setTitle(initialData.title))
        outputHandler?(.prepareDetail(initialData.detailViewPresentation))
    }
    
    func emailTapped() {
        router.openURL("mailto:\(initialData.email)")
    }
    
    func phoneTapped() {
        router.openURL("tel://\(initialData.phone)")

    }
    
    func websiteTapped() {
        router.openURL("https://\(initialData.website)")
    }
    
}

