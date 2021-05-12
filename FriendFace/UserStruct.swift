//
//  UserStruct.swift
//  FriendFace
//
//  Created by Brandon Knox on 5/11/21.
//

import Foundation

struct UserStruct: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date?
    let tags: [String]
    let friends: [FriendStruct]
}
