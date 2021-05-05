//
//  FMPMainAnimalData.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 20.04.21.
//

import Foundation
//import RealmSwift

typealias FMAD = FMPMainAnimalData

class FMPMainAnimalData {

//    dynamic var animals = List<FMPPatModel>()
    static var selectPatId: String {
        get {
            UserDefaults.standard.string(forKey: "SelectPat") ?? ""
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "SelectPat")
        }
    }
}
