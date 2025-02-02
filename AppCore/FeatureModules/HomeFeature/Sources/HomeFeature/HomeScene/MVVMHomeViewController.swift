//
//  MVVMHomeViewController.swift
//  HomeModule
//
//  Created by Özcan AKKOCA on 28.01.2025.
//
//

import UIKit
import SnapKit
import CoreResource
import CoreExtension
import SVProgressHUD

public final class MVVMHomeViewController: UIViewController {
    
    // MARK: - Views
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.registerReusableCell(UserTableViewCell.self)
        return tableView
    }()

    // MARK: - Properties
    var viewModel: HomeViewModelProtocol!

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.loadData()
        viewModel.didSelectRow(at: .zero)
    }
}

// MARK: - Binding
private extension MVVMHomeViewController {
    func bindViewModel() {
        viewModel.outputHandler = { [weak self] outputValue in
            DispatchQueue.main.async {
                self?.handleOutput(outputValue)
            }
        }
    }
    
    func handleOutput(_ output: HomeViewModel.HomeOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        case .showError(let errorMessage):
            SVProgressHUD.showError(withStatus: errorMessage)
        case .reloadData:
            tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDelegate
extension MVVMHomeViewController: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath.row)
    }
}

// MARK: - UITableViewDataSource
extension MVVMHomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemPresentations.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath, type: UserTableViewCell.self)
        cell.prepare(with: viewModel.itemPresentations[indexPath.row])
        return cell
    }
}

// MARK: - UI
private extension MVVMHomeViewController {
    func setupUI() {
        title = CoreLocalize.Home.Title
        view.backgroundColor = CoreColors.white7
        view.addSubviewAndMakeConstraints(tableView)
    }
}
