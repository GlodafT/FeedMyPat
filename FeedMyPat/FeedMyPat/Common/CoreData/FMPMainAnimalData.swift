//
//  FMPMainAnimalData.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 20.04.21.
//

import Foundation
import RealmSwift

typealias FMAD = FMPMainAnimalData

class FMPMainAnimalData: Object {

//    dynamic var animals: [FMPPatModel] = []
    dynamic var selectPatId: UUID = UUID()
}
