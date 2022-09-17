//
//  UserAndFriendApp.swift
//  UserAndFriend
//
//  Created by Andrii Kyrychenko on 11/09/2022.
//

import SwiftUI

@main
struct UserAndFriendApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
