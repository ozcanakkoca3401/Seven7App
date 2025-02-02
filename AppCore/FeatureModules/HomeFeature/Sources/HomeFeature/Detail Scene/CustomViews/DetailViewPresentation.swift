//
//  DetailViewPresentation.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//

import Foundation
import CoreResource
import CoreExtension

struct DetailViewPresentation {
    let attributedNameText: NSAttributedString
    let attributedCompanyText: NSAttributedString
    let attributedCityText: NSAttributedString
    let attributedEmailText: NSAttributedString
    let attributedPhoneText: NSAttributedString
    let attributedAddressText: NSAttributedString
    let attributedWebsiteText: NSAttributedString
    let shortName: String
}

extension DetailViewPresentation {
    init(with model: UserResponse) {
        self.attributedNameText = NSAttributedString.combined(title: CoreLocalize.Home.Name, description: model.name)
        self.attributedCompanyText = NSAttributedString.combined(title: CoreLocalize.Home.Company, description: model.company.name)
        self.attributedCityText = NSAttributedString.combined(title: CoreLocalize.Home.City, description: model.address.city)
        self.attributedEmailText = NSAttributedString.combined(title: CoreLocalize.Home.Email, description: model.email, descriptionColor: .blue)
        self.attributedPhoneText = NSAttributedString.combined(title: "Phone", description: model.phone, descriptionColor: .blue)
        self.attributedWebsiteText = NSAttributedString.combined(title: "Website", description: model.website, descriptionColor: .blue)

        let fullAddress = "\(model.address.street) \(model.address.suite) \(model.address.city) \(model.address.zipcode)"
        attributedAddressText = NSAttributedString.combined(title: "Address", description: fullAddress)
        self.shortName = UserTableViewCellPresentation.getInitials(from: model.name)
    }
}
