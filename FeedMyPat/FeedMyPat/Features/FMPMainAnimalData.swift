//
//  FMPMainAnimalData.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 20.04.21.
//

import Foundation

typealias FMAD = FMPMainAnimalData

class FMPMainAnimalData {
    static var sh: FMPMainAnimalData = FMPMainAnimalData()
    var animals: [FMPPatModel] = []
    var selectPatId: UUID = UUID()
    private init() {}
}
