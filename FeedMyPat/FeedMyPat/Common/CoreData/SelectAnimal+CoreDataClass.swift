//
//  SelectAnimal+CoreDataClass.swift
//  
//
//  Created by Mikita Igonin on 21.04.21.
//
//

import UIKit
import CoreData

@objc(SelectAnimal)
public class SelectAnimal: NSManagedObject {

    func setSelectAnimal(_ data: FMPMainAnimalData) {
        self.id = data.selectPatId
        self.animals = NSOrderedSet(object: data.animals)
    }

    func getSelectAnimal() {
//        FMPMainAnimalData.sh.selectPatId = self.id ?? UUID()
//        FMPMainAnimalData.sh.animals = self.animals?.array as? [FMPPatModel] ?? []

    }

}
