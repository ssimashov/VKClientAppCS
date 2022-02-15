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

struct Item: Codable {
    let id: Int
    let firstName, lastName: String
    let canAccessClosed, isClosed: Bool?
    let photo100: String
    let trackCode: String
    let deactivated: String?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"
        case photo100 = "photo_100"
        case trackCode = "track_code"
        case deactivated
    }
}




/*{
                "id": 584462,
                "first_name": "Ильяс",
                "last_name": "Губайдуллин",
                "can_access_closed": true,
                "is_closed": false,
                "photo_100": "https://sun6-23.userapi.com/58VG_JZaGto0WsiTeM6cCuxvZB2lL5DW5gmTvQ/8pKP9B-c9Uo.jpg",
                "track_code": "16a77817kBZYqwEK90pTmEImIikI-ZhU3jqAqaQvwsG_Sr-usS79fVKfNQb_T16ZcOX4ybeR70CsUw"
            }

*/
