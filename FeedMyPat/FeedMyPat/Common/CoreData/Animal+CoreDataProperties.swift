//
//  Animal+CoreDataProperties.swift
//  
//
//  Created by Mikita Igonin on 21.04.21.
//
//

import Foundation
import CoreData


extension Animal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Animal> {
        return NSFetchRequest<Animal>(entityName: "Animal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var date: String?
    @NSManaged public var type: String?
    @NSManaged public var breed: String?
    @NSManaged public var gender: String?
    @NSManaged public var color: String?
    @NSManaged public var sterilization: String?
    @NSManaged public var chip: String?
    @NSManaged public var mediCats: NSOrderedSet?

}

// MARK: Generated accessors for mediCats
extension Animal {

    @objc(insertObject:inMediCatsAtIndex:)
    @NSManaged public func insertIntoMediCats(_ value: Medicat, at idx: Int)

    @objc(removeObjectFromMediCatsAtIndex:)
    @NSManaged public func removeFromMediCats(at idx: Int)

    @objc(insertMediCats:atIndexes:)
    @NSManaged public func insertIntoMediCats(_ values: [Medicat], at indexes: NSIndexSet)

    @objc(removeMediCatsAtIndexes:)
    @NSManaged public func removeFromMediCats(at indexes: NSIndexSet)

    @objc(replaceObjectInMediCatsAtIndex:withObject:)
    @NSManaged public func replaceMediCats(at idx: Int, with value: Medicat)

    @objc(replaceMediCatsAtIndexes:withMediCats:)
    @NSManaged public func replaceMediCats(at indexes: NSIndexSet, with values: [Medicat])

    @objc(addMediCatsObject:)
    @NSManaged public func addToMediCats(_ value: Medicat)

    @objc(removeMediCatsObject:)
    @NSManaged public func removeFromMediCats(_ value: Medicat)

    @objc(addMediCats:)
    @NSManaged public func addToMediCats(_ values: NSOrderedSet)

    @objc(removeMediCats:)
    @NSManaged public func removeFromMediCats(_ values: NSOrderedSet)

}
