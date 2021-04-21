//
//  FMPPatModel.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 19.04.21.
//

import UIKit

class FMPPatModel {

    // MARK: - gui variables

    var id: UUID
    var nameLabelDescription: String
    var dateOfBirthLabelDescription: String
    var typeLabelDescription: String
    var breedLabelDescription: String
    var genderLabelDescription: String
    var colorLabelDescription: String
    var sterilizationLabelDescription: String
    var chipLabelDescription: String

    var mediCatModel: [FMPMedicatModel] = []

    // MARK: - init

    init(id: UUID = UUID(),
         nameLabelDescription: String,
         dateOfBirthLabelDescription: String,
         typeLabelDescription: String,
         breedLabelDescription: String,
         genderLabelDescription: String,
         colorLabelDescription: String,
         sterilizationLabelDescription: String,
         chipLabelDescription: String) {

        self.id = id
        self.nameLabelDescription = nameLabelDescription
        self.dateOfBirthLabelDescription = dateOfBirthLabelDescription
        self.typeLabelDescription = typeLabelDescription
        self.breedLabelDescription = breedLabelDescription
        self.genderLabelDescription = genderLabelDescription
        self.colorLabelDescription = colorLabelDescription
        self.sterilizationLabelDescription = sterilizationLabelDescription
        self.chipLabelDescription = chipLabelDescription
    }
}
