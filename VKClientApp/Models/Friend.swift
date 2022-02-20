//
//  Friend.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 23.11.2021.

struct Friend {
    var name: String
    var avatar: String?
    var fotoArray: [String]?
}


struct Friend0 {
    let friendID: Int
    let friendFirstName: String
    let friendPhoto: String
}


extension Friend0: Codable {
    enum CodingKeys: String, CodingKey {
               case friendID = "id"
               case friendFirstName = "first_name"
               case friendPhoto = "photo_100"
    }
}
