//
//  DetailView.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//

import UIKit
import CoreResource

protocol DetailViewDelegate: AnyObject {
    func didTapEmail(_ view: DetailView)
    func didTapPhone(_ view: DetailView)
    func didTapWebsite(_ view: DetailView)
}

final class DetailView: UIView {
    
    // MARK: - Views
    private let containerView: UIView = UIView()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(scrollStackView)
        
        scrollStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }

        return scrollView
    }()
    
    private lazy var scrollStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shortNameContainerView])
        stackView.addArrangedSubview(labelsStackView, insets: .init(top: .zero, left: 16, bottom: .zero, right: 16))
        stackView.addArrangedSubview(UIView())
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel,
                                                       companyLabel,
                                                       cityLabel,
                                                       emailLabel,
                                                       phoneLabel,
                                                       websiteLabel,
                                                       addressLabel])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private let shortNameContainerView = UIView()
    private let shortNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = CoreColors.white7
        label.backgroundColor = CoreColors.red7
        label.textAlignment = .center
        label.font = UIFont.regular(64, weight: .medium)
        label.layer.cornerRadius = 75
        label.layer.borderWidth = 2
        label.layer.borderColor = CoreColors.gray7.cgColor
        label.layer.masksToBounds = true
        return label
    }()

    private let nameLabel = UILabel()
    private let companyLabel = UILabel()
    private let cityLabel = UILabel()
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.addTapGestureRecognizer(target: self, action: #selector(emailTapped))
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.addTapGestureRecognizer(target: self, action: #selector(phoneTapped))
        return label
    }()
    
    private lazy var websiteLabel: UILabel = {
        let label = UILabel()
        label.addTapGestureRecognizer(target: self, action: #selector(websiteTapped))
        return label
    }()
    
    // Properties
    weak var delegate: DetailViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Prepare
extension DetailView {
    func prepare(with presentation: DetailViewPresentation) {
        shortNameLabel.text = presentation.shortName
        nameLabel.attributedText = presentation.attributedNameText
        companyLabel.attributedText = presentation.attributedCompanyText
        cityLabel.attributedText = presentation.attributedCityText
        emailLabel.attributedText = presentation.attributedEmailText
        addressLabel.attributedText = presentation.attributedAddressText
        phoneLabel.attributedText = presentation.attributedPhoneText
        websiteLabel.attributedText = presentation.attributedWebsiteText
    }
}

// MARK: - UI
private extension DetailView {
    func setupUI() {
        backgroundColor = CoreColors.white7
        
        addSubviewAndMakeConstraints(containerView)
        containerView.addSubviewAndMakeConstraints(scrollView)
        
        shortNameContainerView.addSubview(shortNameLabel)
        shortNameContainerView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        
        shortNameLabel.snp.makeConstraints { make in
            make.size.equalTo(150)
            make.center.equalToSuperview()
        }
    }
}

// MARK: - Actions
private extension DetailView {
    @objc func emailTapped() {
        delegate?.didTapEmail(self)
    }
    
    @objc func phoneTapped() {
        delegate?.didTapPhone(self)
    }
    
    @objc func websiteTapped() {
        delegate?.didTapWebsite(self)
    }
}

