//
//  Medicat+CoreDataClass.swift
//  
//
//  Created by Mikita Igonin on 21.04.21.
//
//

import Foundation
import CoreData

@objc(Medicat)
public class Medicat: NSManagedObject {

    func setMedicats(model: FMPMedicatModel) {
        self.type = model.typeDescriptionLabel
        self.date = model.dateDescriptionLabel
    }

    func getMedicats() -> FMPMedicatModel {
        
    }

}
