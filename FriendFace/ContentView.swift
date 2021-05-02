//
//  ContentView.swift
//  FriendFace
//
//  Created by Brandon Knox on 4/30/21.
//

import SwiftUI

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

struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { item in
                NavigationLink(destination: DetailView(user: item, friends: findFriends(friends: item.friends))) {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.company)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("FriendFace Home")
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try?JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                    }
                    print("Results returned")
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            print(request)
        }.resume()
    }
    
    func findFriends(friends: [Friend]) -> [User] {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
