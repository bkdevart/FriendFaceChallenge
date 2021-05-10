//
//  User+CoreDataClass.swift
//  FriendFace
//
//  Created by Brandon Knox on 5/3/21.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject, Codable {
    
    enum CodingKeys: CodingKey {
        case name
        case about
        case age
        case company
        case email
        case id
        case isActive
        case registered
        case tags
    }
    
//    var name = ""
    
    required convenience public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.init()
        name = try container.decode(String.self, forKey: .name)
        about = try container.decode(String.self, forKey: .about)
        age = try container.decode(Int16.self, forKey: .age)
        company = try container.decode(String.self, forKey: .company)
        email = try container.decode(String.self, forKey: .email)
//        id = try container.decode(String.self, forKey: .id)
        isActive = try container.decode(Bool.self, forKey: .isActive)
        registered = try container.decode(String.self, forKey: .registered)
        tags = try container.decode([String].self, forKey: .tags)
        
        
//        super.init(context: NSManagedObjectContext,
//                   name: String,
//            dateOfBirth: NSDate,
//                 salary: NSDecimalNumber,
//             employeeId: String = NSUUID().UUIDString,
//                  email: String? = nil,
//                address: String? = nil))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
    }
}
