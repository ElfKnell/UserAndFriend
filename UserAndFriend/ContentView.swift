//
//  ContentView.swift
//  UserAndFriend
//
//  Created by Andrii Kyrychenko on 11/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
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
                        }
                    }
            }
            //.navigationTitle("Users")
        }
    }
    
    func loadData() async {
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid Data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
