//
//  PersistanceController.swift
//  pleny
//
//  Created by Ahmed Fathy on 17/03/2023.
//

import Foundation
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container = NSPersistentContainer(name: "SavedPosts")
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Failed to load data.")
                print(error.localizedDescription)
            }
        }
    }
}
