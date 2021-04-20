//
//  FMPMedicatModel.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 7.04.21.
//

import UIKit

class FMPMedicatModel {

    var imageView: UIImageView?
    var nameLabel: String
    var typeLabel: String
    var typeDescriptionLabel: String
    var dateLabel: String
    var dateDescriptionLabel: Date

    init(
         imageView: UIImageView? = nil,
         nameLabel: String = "Vaccine",
         typeLabel: String = "Type:",
         typeDescriptionLabel: String,
         dateLabel: String = "Date:",
         dateDescriptionLabel: Date) {

        self.imageView = imageView
        self.nameLabel = nameLabel
        self.typeLabel = typeLabel
        self.typeDescriptionLabel = typeDescriptionLabel
        self.dateLabel = dateLabel
        self.dateDescriptionLabel = dateDescriptionLabel
    }
}
