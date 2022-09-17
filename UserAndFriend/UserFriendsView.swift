//
//  UserFriendsView.swift
//  UserAndFriend
//
//  Created by Andrii Kyrychenko on 11/09/2022.
//

import SwiftUI

struct UserFriendsView: View {
    var user: User?
    
    @State private var friends = [Friend]()
    @State private var date = Date.now
    
    var body: some View {
        Section {
            Text(user?.name ?? "N/A")
            Text(user?.company ?? "N/A")
            Text("\(date)")
                
            
            ScrollView {
                ForEach(friends, id: \.id) { item in
                    Text(item.name)
                }
                .task {
                    loadFriend()
                }
            }
        }
    }
    
    func loadFriend() {
        guard let user = user else {
            return
        }

        friends = user.friends
        
        date = DateFormatter().date(from: user.registered) ?? Date.now
    }
}

struct UserFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        UserFriendsView(user: nil)
    }
}
