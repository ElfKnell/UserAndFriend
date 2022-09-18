//
//  ContentView.swift
//  UserAndFriend
//
//  Created by Andrii Kyrychenko on 11/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
                ScrollView {
                    ForEach(users, id: \.id) { item in
                        NavigationLink {
                            UserFriendsView(user: item)
                        } label: {
                            HStack {
                                Text(item.name)
                                
                                Spacer()
                                
                                Text("\(item.isActive ? "✅" : "❎")")
                                
                            }
                            .padding()
                        }
                    }
                    .task {
                        if users.isEmpty {
                            await loadData()
                        } else {
                            returnData()
                        }
                    }
            }
            //.navigationTitle("Users")
        }
    }
    
    func loadData() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            returnData()
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
                saveData()
            }
        } catch {
            print("Invalid Data")
        }
    }
    
    func saveData() {
        
        print("--------- work save ----------")
        
        for user in users {
            for friend in user.friends {
                let friendD = CachedFriends(context: moc)
                
                friendD.id = friend.id
                friendD.name = friend.name
                friendD.origin = CachedUser(context: moc)
                friendD.origin?.id = user.id
                friendD.origin?.isActive = user.isActive
                friendD.origin?.name = user.name
                friendD.origin?.age = Int16(user.age)
                friendD.origin?.company = user.company
                friendD.origin?.email = user.email
                friendD.origin?.address = user.address
                friendD.origin?.registered = user.registered
                friendD.origin?.tags = user.tags.joined(separator: ", ")
                
                try? moc.save()
            }
        }
    }
    
    func returnData() {
        var user: User
        var friends = [Friend]()
        var friend: Friend
        
        print("--------- work return ----------")
        
        if cachedUsers.isEmpty {
            users = []
        } else {
            users = []
            for cUser in cachedUsers {
                for cFriend in cUser.friendsArray {
                    friend = Friend(id: cFriend.wrappedId, name: cFriend.wrappedName)
                    friends.append(friend)
                }
                user = User(id: cUser.uId, isActive: cUser.isActive, name: cUser.uName, age: cUser.uAge, company: cUser.uCompany, email: cUser.uEmail, address: cUser.uAddress, about: cUser.uAboute, registered: cUser.uRegistered, tags: cUser.uTags, friends: friends)
                users.append(user)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
