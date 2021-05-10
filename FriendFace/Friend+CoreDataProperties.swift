//
//  Friend+CoreDataProperties.swift
//  FriendFace
//
//  Created by Brandon Knox on 5/6/21.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var friendId: UUID?
    @NSManaged public var friendName: String?
    @NSManaged public var user: NSSet?

    public var wrappedFriendName: String {
        friendName ?? "Unknown friend name"
    }
    
    public var userArray: [User] {
        let set = user as? Set<User> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for user
extension Friend {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: User)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: User)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}
