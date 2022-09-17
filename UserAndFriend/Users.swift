//
//  Users.swift
//  UserAndFriend
//
//  Created by Andrii Kyrychenko on 11/09/2022.
//

import Foundation

//class Users: Codable, ObservableObject {
//    enum CodingKeys: CodingKey {
//        case user
//    }
//    
//    @Published var user = User()
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(user, forKey: .user)
//    }
//    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        user = try container.decode(User.self, forKey: .user)
//    }
//    
//    init() {}
//}

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable {
    var id: String
    var name: String
}
