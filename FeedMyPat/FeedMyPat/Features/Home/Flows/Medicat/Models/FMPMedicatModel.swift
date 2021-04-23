//
//  FMPMedicatModel.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 7.04.21.
//

import Foundation
import RealmSwift

class FMPMedicatModel: Object {

//    var imageView: UIImageView? = nil
    dynamic var typeDescriptionLabel: String = ""
    dynamic var dateDescriptionLabel: String = ""
    dynamic var patModel: FMPPatModel!

//    init(
////         imageView: UIImageView? = nil,
////         nameLabel: String = "Vaccine",
//         typeDescriptionLabel: String,
//         dateDescriptionLabel: String) {
//
////        self.imageView = imageView
//        self.typeDescriptionLabel = typeDescriptionLabel
//        self.dateDescriptionLabel = dateDescriptionLabel
//    }
}
