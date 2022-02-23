//
//  Group.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 23.11.2021.
//
//struct Group {
//    var name: String
//    var avatar: String?
//}

struct GroupsResponse: Codable {
    let response: GroupsItemsResponse
}


struct GroupsItemsResponse {
    let groups: [Groups]
}

extension GroupsItemsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case groups = "items"
    }
}

struct Groups {
    let groupID: Int
    let groupName: String
    let groupPhoto: String
}


extension Groups: Codable {
    enum CodingKeys: String, CodingKey {
               case groupID = "id"
               case groupName = "name"
               case groupPhoto = "photo_100"
    }
}
