//
//  FMPSelectPat.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 20.04.21.
//

import Foundation

typealias FSP = FMPSelectPat

class FMPSelectPat {

    static var selectPatId: String {
        get {
            UserDefaults.standard.string(forKey: "SelectPat") ?? ""
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "SelectPat")
            NotificationCenter.default.post(name: Notification.Name("SelectPatChange"), object: nil)
        }
    }
}
