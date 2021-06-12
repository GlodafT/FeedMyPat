//
//  Medicat+CoreDataProperties.swift
//  
//
//  Created by Mikita Igonin on 21.04.21.
//
//

import Foundation
import CoreData

extension Medicat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medicat> {
        return NSFetchRequest<Medicat>(entityName: "Medicat")
    }

    @NSManaged public var type: String?
    @NSManaged public var date: String?
    @NSManaged public var animal: Animal?

}
