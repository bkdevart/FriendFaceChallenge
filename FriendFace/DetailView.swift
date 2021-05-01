//
//  DetailView.swift
//  FriendFace
//
//  Created by Brandon Knox on 5/1/21.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text(user.name)
            Text(String(user.age))
            Text(user.company)
            Text("Friends:")
            List(user.friends, id: \.id) { item in
                Text(item.name)
            }
        }
    }
    
    init(user: User) {
        self.user = user
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
        DetailView(user: user)
    }
}
