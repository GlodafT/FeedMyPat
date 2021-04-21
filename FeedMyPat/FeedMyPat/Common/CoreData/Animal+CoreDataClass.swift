//
//  Animal+CoreDataClass.swift
//  
//
//  Created by Mikita Igonin on 21.04.21.
//
//

import Foundation
import CoreData

@objc(Animal)
public class Animal: NSManagedObject {

    func setAnimals(model: FMPPatModel) {
        self.id = model.id
        self.name = model.nameLabelDescription
        self.date = model.dateOfBirthLabelDescription
        self.type = model.typeLabelDescription
        self.breed = model.breedLabelDescription
        self.gender = model.genderLabelDescription
        self.color = model.colorLabelDescription
        self.sterilization = model.sterilizationLabelDescription
        self.chip = model.chipLabelDescription
        self.mediCats = NSOrderedSet(object: model.mediCatModel)
    }

}