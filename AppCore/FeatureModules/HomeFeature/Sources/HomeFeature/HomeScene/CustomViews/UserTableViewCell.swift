//
//  UserTableViewCell.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 1.02.2025.
//
  
import UIKit
import CoreResource

final class UserTableViewCell: UITableViewCell {
    
    // MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [shortNameContainerView,
                                                       verticalStackView])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let shortNameContainerView = UIView()
    private let shortNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = CoreColors.white7
        label.backgroundColor = CoreColors.red7
        label.textAlignment = .center
        label.font = UIFont.regular(16, weight: .medium)
        label.layer.cornerRadius = 25
        label.layer.borderWidth = 2
        label.layer.borderColor = CoreColors.gray7.cgColor
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel, cityLabel, emailLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let nameLabel = UILabel()
    private let companyLabel = UILabel()
    private let cityLabel = UILabel()
    private let emailLabel = UILabel()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = CoreColors.gray7
        return view
    }()

    // MARK: - Properties
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepare(with presentation: UserTableViewCellPresentation) {
        nameLabel.attributedText = presentation.attributedNameText
        companyLabel.attributedText = presentation.attributedCompanyText
        cityLabel.attributedText = presentation.attributedCityText
        emailLabel.attributedText = presentation.attributedEmailText

        shortNameLabel.text = presentation.shortName
    }
}

private extension UserTableViewCell {
    func setupUI() {
        selectionStyle = .none
        contentView.addSubviewAndMakeConstraints(containerView)
        containerView.addSubviewAndMakeConstraints(containerStackView, horizontal: 12, vertical: 16)
        shortNameContainerView.addSubview(shortNameLabel)
        
        contentView.addSubview(lineView)
        
        shortNameContainerView.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
        
        shortNameLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview().inset(12)
        }
    }
}
