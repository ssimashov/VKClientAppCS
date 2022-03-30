//
//  RealmPhotos.swift
//  VKClientAppCS
//
//  Created by Sergey Simashov on 26.03.2022.
//

import Foundation
import RealmSwift

class RealmPhotos: Object {
    @Persisted(indexed: true) var userID: Int = Int()
    @Persisted(primaryKey: true) var photoUrl: String = ""
}

extension RealmPhotos {
    convenience init(userID: Int,
                     photos: Photos) {
        self.init()
        self.userID = userID
        self.photoUrl = photos.photoSizes.first!.photoUrl
    }
}



