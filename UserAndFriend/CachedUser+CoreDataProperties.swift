//
//  CachedUser+CoreDataProperties.swift
//  UserAndFriend
//
//  Created by Andrii Kyrychenko on 18/09/2022.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var aboute: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?

    public var uId: String {
        id ?? "none"
    }
    
    public var uName: String {
        name ?? "Unknown"
    }
    
    public var uAge: Int {
        Int(age)
    }
    
    public var uCompany: String {
        company ?? "Unknown"
    }
    
    public var uEmail: String {
        email ?? "Unknown"
    }
    
    public var uAddress: String {
        address ?? "Unknown"
    }
    
    public var uAboute: String {
        aboute ?? "Unknown"
    }
    
    public var uRegistered: String {
        registered ?? "none time"
    }
    
    public var uTags: [String] {
        guard let tags = tags else {
            return []
        }
        
        return tags.components(separatedBy: ", ")
    }
    
    public var friendsArray: [CachedFriends] {
        let set = friends as? Set<CachedFriends> ?? []
        
        return set.sorted {
            $0.wrappedId < $1.wrappedId
        }
    }
}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriends)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriends)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
