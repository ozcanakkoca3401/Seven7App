//
//  DetailInitialData.swift
//  HomeFeature
//
//  Created by Özcan AKKOCA on 2.02.2025.
//

import Foundation
import CoreResource
import UIKit

struct DetailInitialData {
    let detailViewPresentation: DetailViewPresentation
    let email: String
    let phone: String
    let website: String
    let title: String
}

extension DetailInitialData {
    init(with model: UserResponse) {
        detailViewPresentation = .init(with: model)
        self.title = model.username
        self.email = model.email
        self.phone = model.phone
        self.website = model.website
    }
}
