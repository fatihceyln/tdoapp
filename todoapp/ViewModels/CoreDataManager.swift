//
//  CoreDataManager.swift
//  todoapp
//
//  Created by Fatih Kilit on 24.01.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "Container")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error. \(error)")
            }
        }
        
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error. \(error)")
        }
    }
}
