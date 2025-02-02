//
//  NoDataView.swift
//  
//
//  Created by Ozcan Akkoca on 28.01.2024.
//

import UIKit

public final class NoDataView: UIView {
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let noDataImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName:"magnifyingglass.circle.fill")
        return imageView
    }()
    
    private let noDataLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = .zero
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func prepare(with presentation: String) {
        noDataLabel.text = presentation
    }
    
}

// MARK: SetupUI
private extension NoDataView {
    private func setupUI() {
        self.addSubview(containerView)
        containerView.addSubview(noDataImageView)
        containerView.addSubview(noDataLabel)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        noDataImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(100)
        }
        
        noDataLabel.snp.makeConstraints { make in
            make.top.equalTo(noDataImageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        
    }
}
