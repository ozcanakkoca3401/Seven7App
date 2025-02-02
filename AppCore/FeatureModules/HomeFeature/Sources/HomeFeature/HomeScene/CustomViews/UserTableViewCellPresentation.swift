//
//  UserTableViewCellPresentation.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 1.02.2025.
//

import UIKit
import Foundation
import CoreResource
import CoreExtension

struct UserTableViewCellPresentation {
    let attributedNameText: NSAttributedString
    let attributedCompanyText: NSAttributedString
    let attributedCityText: NSAttributedString
    let attributedEmailText: NSAttributedString
    let shortName: String
}

extension UserTableViewCellPresentation {
    init (with model: UserResponse) {
        self.attributedNameText = NSAttributedString.combined(title: CoreLocalize.Home.Name, description: model.name)
        self.attributedCompanyText =  NSAttributedString.combined(title: CoreLocalize.Home.Company, description: model.company.name)
        self.attributedCityText =  NSAttributedString.combined(title: CoreLocalize.Home.City, description: model.address.city)
        self.attributedEmailText =  NSAttributedString.combined(title: CoreLocalize.Home.Email, description: model.email)

        self.shortName = UserTableViewCellPresentation.getInitials(from: model.name)
    }
}

extension UserTableViewCellPresentation {
    
    static func getInitials(from fullName: String) -> String {
        let components = fullName.split(separator: " ")
        let initials = components.compactMap { $0.first }.map { String($0) }
        return initials.joined()
    }
}

