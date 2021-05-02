//
//  File.swift
//  FriendFace
//
//  Created by Brandon Knox on 5/1/21.
//

import Foundation

var users = [User]()

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var about: String
    var registered: String  // change to date later
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable {
    var id: String
    var name: String
}

//func loadData() -> [User] {
//    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
//        print("Invalid URL")
//        return [User]()
//    }
//
//    let request = URLRequest(url: url)
//
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        if let data = data {
//            if let decodedResponse = try?JSONDecoder().decode([User].self, from: data) {
//                DispatchQueue.main.async {
//                    users = decodedResponse
//                }
//                print("Results returned")
//                return
//            }
//        }
//        print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//        print(request)
//    }.resume()
//    
//    return users
//}

func findFriends(friends: [Friend], users: [User]) -> [User] {
    // return a list of User items representing this user's friends
    var userFriends = [User]()
    
    for user in friends {
        if let match = users.first(where: { $0.id == user.id}) {
            userFriends.append(match)
        } else {
            fatalError("Missing \(user.name)")
        }
    }
    
    return userFriends
}
