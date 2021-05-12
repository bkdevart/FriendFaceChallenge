//
//  ContentView.swift
//  FriendFace
//
//  Created by Brandon Knox on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: []) var users: FetchedResults<User>
//    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            
            List(users, id: \.id) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.wrappedName)
                            .font(.headline)
                        Text(user.wrappedCompany)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("FriendFace Home")
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        var loadedUsers = [UserStruct]()
        
        if !users.isEmpty {
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                // crashes here
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let decodedResponse = try?decoder.decode([UserStruct].self, from: data) {
                    DispatchQueue.main.async {
                        loadedUsers = decodedResponse
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
                fatalError("Missing \(user.wrappedName)")
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
