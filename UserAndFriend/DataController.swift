//
//  DataController.swift
//  UserAndFriend
//
//  Created by Andrii Kyrychenko on 17/09/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("CoreDataProject failed to load: \(error.localizedDescription)")
            }
        }
    }
}
