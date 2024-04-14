//
//  CoreDataManager.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import UIKit
import CoreData

final class CoreDataManager: CoreDataManagerProtocol {
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Database")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

// TODO: Update queries to be done
extension CoreDataManager {
    func saveSections(dto: [ViaplaySectionDTO]?) {
        let existingData = fetchSections()
        let dataToInsert = dto?.filter { dto in
            !(existingData?.contains { model in
                model.id == dto.id
            } ?? false)
        }
        
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Entities.Tables.VIAPLAY_SECTION, in: managedContext)!
        dataToInsert?.forEach { section in
            let object = NSManagedObject(entity: entity, insertInto: managedContext)
            object.setValue(section.id, forKey: Entities.Columns.Generic.ID)
            object.setValue(section.title, forKey: Entities.Columns.ViaplaySection.TITLE)
            object.setValue(section.href, forKey: Entities.Columns.ViaplaySection.URI)
        }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchSections() -> [ViaplaySectionDTO]? {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Entities.Tables.VIAPLAY_SECTION)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            if let result = result as? [NSManagedObject] {
                return result.map {
                    ViaplaySectionDTO(
                        id: $0.value(forKey: Entities.Columns.Generic.ID) as? String,
                        title: $0.value(forKey: Entities.Columns.ViaplaySection.TITLE) as? String,
                        href: $0.value(forKey: Entities.Columns.ViaplaySection.URI) as? String,
                        type: nil,
                        sectionSort: nil,
                        name: nil,
                        templated: nil
                    )
                }
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    func saveSectionDetail(dto: ViaplaySectionDetailDTO?) {
        if let existingData = fetchSectionDetail(with: dto?.id) {
            return
        }
        
        let managedContext = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: Entities.Tables.VIAPLAY_SECTION_DETAIL, in: managedContext)!
        let object = NSManagedObject(entity: entity, insertInto: managedContext)
        object.setValue(dto?.id, forKey: Entities.Columns.Generic.ID)
        object.setValue(dto?.title, forKey: Entities.Columns.ViaplaySectionDetail.TITLE)
        object.setValue(dto?.description, forKey: Entities.Columns.ViaplaySectionDetail.DESCRIPTION)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchSectionDetail(with id: String?) -> ViaplaySectionDetailDTO? {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Entities.Tables.VIAPLAY_SECTION_DETAIL)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            if let result = result as? [NSManagedObject] {
                return result.first(where: {
                    let objectId = $0.value(forKey: Entities.Columns.Generic.ID) as? String
                    return objectId == id
                }).map {
                    return ViaplaySectionDetailDTO(
                        id: $0.value(forKey: Entities.Columns.Generic.ID) as? String,
                        title: $0.value(forKey: Entities.Columns.ViaplaySectionDetail.TITLE) as? String,
                        description: $0.value(forKey: Entities.Columns.ViaplaySectionDetail.DESCRIPTION) as? String
                    )
                }
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}
