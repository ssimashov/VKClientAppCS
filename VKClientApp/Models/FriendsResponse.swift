//
//  FriendsResponse.swift
//  VKClientAppCS
//
//  Created by Sergey Simashov on 15.02.2022.
//

struct FriendsResponse: Codable {
    let response: FriendsItemsResponse
}


struct FriendsItemsResponse {
    let friends: [Friend0]
}

extension FriendsItemsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case friends = "items"
    }    
}

