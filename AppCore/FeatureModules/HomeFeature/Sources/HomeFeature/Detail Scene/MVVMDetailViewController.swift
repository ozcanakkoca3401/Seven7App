//
//  MVVMDetailViewController.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import CoreResource

final class MVVMDetailViewController: UIViewController {
    
    // MARK: - Views
    private lazy var detailView: DetailView = {
        let view = DetailView()
        view.delegate = self
        return view
    }()
    
    // MARK: - Properties
    var viewModel: DetailViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.loadData()
    }
}

// MARK: - Binding
private extension MVVMDetailViewController {
    func bindViewModel() {
        viewModel.outputHandler = { [weak self] outputValue in
            DispatchQueue.main.async {
                self?.handleOutput(outputValue)
            }
        }
    }
    
    func handleOutput(_ output: DetailViewModel.DetailOutput) {
        switch output {
        case .setTitle(let title):
            self.title = title
        case .prepareDetail(let presentation):
            detailView.prepare(with: presentation)
        }
    }
}

// MARK: - UI
private extension MVVMDetailViewController {
    func setupUI() {
        view.backgroundColor = CoreColors.white7
        view.addSubviewAndMakeConstraints(detailView)        
    }
}

// MARK: - DetailViewDelegate
extension MVVMDetailViewController: DetailViewDelegate {
    func didTapEmail(_ view: DetailView) {
        viewModel.emailTapped()
    }
    
    func didTapPhone(_ view: DetailView) {
        viewModel.phoneTapped()
    }
    
    func didTapWebsite(_ view: DetailView) {
        viewModel.websiteTapped()
    }
}
