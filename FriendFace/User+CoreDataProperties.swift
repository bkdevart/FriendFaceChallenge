//
//  User+CoreDataProperties.swift
//  FriendFace
//
//  Created by Brandon Knox on 5/4/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var about: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: NSObject?
    @NSManaged public var friends: NSSet?

    public var wrappedAbout: String {
        about ?? "Unknown about"
    }

    public var wrappedCompany: String {
        about ?? "Unknown company"
    }

    public var wrappedEmail: String {
        about ?? "Unknown email"
    }

    public var wrappedName: String {
        about ?? "Unknown name"
    }

    public var wrappedRegistered: String {
        about ?? "Unknown registered"
    }

    public var wrappedTags: String {
        about ?? "Unknown tags"
    }

    public var friendsArray: [Friend] {
        let set = friends as? Set<Friend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension User : Identifiable {

}
