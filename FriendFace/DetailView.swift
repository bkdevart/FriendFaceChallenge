//
//  DetailView.swift
//  FriendFace
//
//  Created by Brandon Knox on 5/1/21.
//

import SwiftUI

struct DetailView: View {
    let user: User
    let friends: [User]
    let users: [User]
    
    var body: some View {
        VStack {
            Text(user.name)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text(user.company)
                .foregroundColor(.secondary)
            Text("Age: " + String(user.age))
                .font(.caption)
            Text(user.about)
            Text("Member since \(user.registered)")
                .font(.footnote)
            NavigationView {
                List(friends, id: \.id) { item in
                    // need to look up id off of User and pass to DetailViews
                    NavigationLink(destination: DetailView(user: item,
                                                           friends: findFriends(friends: item.friends, users: self.users),
                                                           users: self.users)) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.company)
                            .foregroundColor(.secondary)
                    }
                }
                .navigationTitle("\(user.name)'s friends")  // pull first name only
            }
        }
        .padding(.horizontal)
    }
    
    init(user: User, friends: [User], users: [User]) {
        self.user = user
        self.friends = friends
        self.users = users
    }
}

struct DetailView_Previews: PreviewProvider {
    static let friend = Friend(id: "b", name: "John")
    static let user = User(id: "a",
                           isActive: false,
                           name: "Biff",
                           age: 39,
                           company: "ABC Company",
                           email: "biff@abc.com",
                           about: "So many things",
                           registered: "2021-05-01",
                           tags: ["abc"],
                           friends: [friend]
                           )
    
    static var previews: some View {
        DetailView(user: user, friends: [user], users: [user])
    }
}
