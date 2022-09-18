//
//  CachedFriends+CoreDataProperties.swift
//  UserAndFriend
//
//  Created by Andrii Kyrychenko on 18/09/2022.
//
//

import Foundation
import CoreData


extension CachedFriends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriends> {
        return NSFetchRequest<CachedFriends>(entityName: "CachedFriends")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: CachedUser?
    
    public var wrappedId: String {
        id ?? "none"
    }
    
    public var wrappedName: String {
        name ?? "Unknown"
    }

}

extension CachedFriends : Identifiable {

}
