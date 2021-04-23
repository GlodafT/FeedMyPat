//
//  FMPMainAnimalData.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 20.04.21.
//

import Foundation
import CoreData

typealias FMAD = FMPMainAnimalData

class FMPMainAnimalData {
//    static var sh: FMPMainAnimalData = FMPMainAnimalData()

    // MARK: - variables

    var animals: [FMPPatModel] = []

    var selectPatId: UUID = UUID()

//    // MARK: - properties
//
//    private static let dataBaseContainerName = "FMPDataModel"
//
//    private let documentDirectory: URL
//
//    // MARK: - core data
//
//    private lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: FMAD.dataBaseContainerName)
//        container.loadPersistentStores { (description, error) in
//            if let error = error {
//                Swift.debugPrint(error.localizedDescription)
//            }
//            Swift.debugPrint("Store description: \(description)")
//        }
//
//        return container
//    }()
//
//    private var context: NSManagedObjectContext {
//        self.persistentContainer.viewContext
//    }
//
//    // MARK: - initialization
//
//    private init() {
//        let docDirectory = FileManager.default.urls(for: .documentDirectory,
//                                                    in: .userDomainMask)
//        if docDirectory.count > 0 {
//            self.documentDirectory = docDirectory[0]
//        } else {
//            fatalError("Directory doesnt't exist")
//        }
//    }
//
//    // MARK: - core data functions
//
//    func saveContext() {
//        if self.context.hasChanges {
//            Swift.debugPrint("Context inserted objects: \(self.context.insertedObjects)")
//            Swift.debugPrint("Context delited objects: \(self.context.deletedObjects)")
//
//            do {
//                try self.context.save()
//                Swift.debugPrint("Context was saved")
//            } catch  {
//                let nsError = error as NSError
//                Swift.debugPrint("Coulden't saved data. Reason: \(nsError.localizedDescription) \(nsError.userInfo)")
//            }
//        }
//    }
//    func save(animalsData: FMAD) {
//        let coreDataAnimals = SelectAnimal(context: self.context)
//        coreDataAnimals.setSelectAnimal(animalsData)
//        self.saveContext()
//    }
}
