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
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var typeDescriptionLabel: String = ""
    @objc dynamic var dateDescriptionLabel: String = ""
//    dynamic var patModel: FMPPatModel!

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

    convenience init (id: String,
                      type: String,
                      date: String) {
        self.init()
        self.id = id
        self.typeDescriptionLabel = type
        self.dateDescriptionLabel = date
    }
}
