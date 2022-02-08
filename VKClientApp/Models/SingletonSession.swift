//
//  SingletonSession.swift
//  VKClientAppCS
//
//  Created by Sergey Simashov on 08.02.2022.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init() {}
    
    var token: String = ""
    var userId: Int = 0
}
