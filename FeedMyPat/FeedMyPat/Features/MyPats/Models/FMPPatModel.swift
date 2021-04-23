//
//  FMPPatModel.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 19.04.21.
//

import Foundation
import RealmSwift

class FMPPatModel: Object {

    // MARK: - gui variables

    dynamic var id: UUID = UUID()
    dynamic var nameLabelDescription: String = ""
    dynamic var dateOfBirthLabelDescription: String = ""
    dynamic var typeLabelDescription: String = ""
    dynamic var breedLabelDescription: String = ""
    dynamic var genderLabelDescription: String = ""
    dynamic var colorLabelDescription: String = ""
    dynamic var sterilizationLabelDescription: String = ""
    dynamic var chipLabelDescription: String = ""

    dynamic var mainData: FMAD!

//    dynamic var mediCatModel: [FMPMedicatModel] = []

    // MARK: - init

//    init(
//         nameLabelDescription: String,
//         dateOfBirthLabelDescription: String,
//         typeLabelDescription: String,
//         breedLabelDescription: String,
//         genderLabelDescription: String,
//         colorLabelDescription: String,
//         sterilizationLabelDescription: String,
//         chipLabelDescription: String) {
//
//        self.nameLabelDescription = nameLabelDescription
//        self.dateOfBirthLabelDescription = dateOfBirthLabelDescription
//        self.typeLabelDescription = typeLabelDescription
//        self.breedLabelDescription = breedLabelDescription
//        self.genderLabelDescription = genderLabelDescription
//        self.colorLabelDescription = colorLabelDescription
//        self.sterilizationLabelDescription = sterilizationLabelDescription
//        self.chipLabelDescription = chipLabelDescription
//    }
}
