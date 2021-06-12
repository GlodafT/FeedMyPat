//
//  FMPRealmManager.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 5.05.21.
//

import Foundation
import RealmSwift

class FMPRealmManager {

    static var safeRealm: Realm {
        get {
            do {
                let realm = try Realm()
                return realm
            }
            catch let error as NSError {
                Swift.debugPrint("realm init ERROR: \(error)")
            }
            return self.safeRealm
        }
    }

    public static func write(realm: Realm, writeClosure: () -> Void) {
        do {
            try realm.write {
                writeClosure()
            }
        } catch let error as NSError {
            Swift.debugPrint("realm write ERROR: \(error)")
        }
    }
}
