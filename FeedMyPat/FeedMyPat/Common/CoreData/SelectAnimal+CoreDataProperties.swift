//
//  SelectAnimal+CoreDataProperties.swift
//  
//
//  Created by Mikita Igonin on 21.04.21.
//
//

import Foundation
import CoreData

extension SelectAnimal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SelectAnimal> {
        return NSFetchRequest<SelectAnimal>(entityName: "SelectAnimal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var animals: NSOrderedSet?

}

// MARK: Generated accessors for animals
extension SelectAnimal {

    @objc(insertObject:inAnimalsAtIndex:)
    @NSManaged public func insertIntoAnimals(_ value: Animal, at idx: Int)

    @objc(removeObjectFromAnimalsAtIndex:)
    @NSManaged public func removeFromAnimals(at idx: Int)

    @objc(insertAnimals:atIndexes:)
    @NSManaged public func insertIntoAnimals(_ values: [Animal], at indexes: NSIndexSet)

    @objc(removeAnimalsAtIndexes:)
    @NSManaged public func removeFromAnimals(at indexes: NSIndexSet)

    @objc(replaceObjectInAnimalsAtIndex:withObject:)
    @NSManaged public func replaceAnimals(at idx: Int, with value: Animal)

    @objc(replaceAnimalsAtIndexes:withAnimals:)
    @NSManaged public func replaceAnimals(at indexes: NSIndexSet, with values: [Animal])

    @objc(addAnimalsObject:)
    @NSManaged public func addToAnimals(_ value: Animal)

    @objc(removeAnimalsObject:)
    @NSManaged public func removeFromAnimals(_ value: Animal)

    @objc(addAnimals:)
    @NSManaged public func addToAnimals(_ values: NSOrderedSet)

    @objc(removeAnimals:)
    @NSManaged public func removeFromAnimals(_ values: NSOrderedSet)

}
