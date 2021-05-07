//
//  FMPPatModel.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 19.04.21.
//

import Foundation
import RealmSwift

class FMPPatModel: Object {

    // MARK: - variables

    @objc dynamic var id = UUID().uuidString
    @objc dynamic var nameLabelDescription: String = ""
    @objc dynamic var dateOfBirthLabelDescription: String = ""
    @objc dynamic var typeLabelDescription: String = ""
    @objc dynamic var breedLabelDescription: String = ""
    @objc dynamic var genderLabelDescription: String = ""
    @objc dynamic var colorLabelDescription: String = ""
    @objc dynamic var sterilizationLabelDescription: String = ""
    @objc dynamic var chipLabelDescription: String = ""

//    dynamic var mediCatsData = List<FMPMedicatModel>()

    // MARK: - init

    convenience init(name: String,
                     date: String,
                     type: String,
                     breed: String,
                     gender: String,
                     color: String,
                     sterilization: String,
                     chip: String) {
        self.init()
        self.nameLabelDescription = name
        self.dateOfBirthLabelDescription = date
        self.typeLabelDescription = type
        self.breedLabelDescription = breed
        self.genderLabelDescription = gender
        self.colorLabelDescription = color
        self.sterilizationLabelDescription = sterilization
        self.chipLabelDescription = chip
    }
}
