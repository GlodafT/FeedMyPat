//
//  FMPMedicatModel.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 7.04.21.
//

import UIKit

class FMPMedicatModel {

    var imageView: UIImageView?
    var typeDescriptionLabel: String
    var dateDescriptionLabel: String

    init(
         imageView: UIImageView? = nil,
         nameLabel: String = "Vaccine",
         typeDescriptionLabel: String,
         dateDescriptionLabel: String) {

        self.imageView = imageView
        self.typeDescriptionLabel = typeDescriptionLabel
        self.dateDescriptionLabel = dateDescriptionLabel
    }
}
