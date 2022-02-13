//
//  NetworkService.swift
//  VKClientAppCS
//
//  Created by Sergey Simashov on 13.02.2022.
//

import Foundation

final class NetworkService {
    let url = URL(string: "https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V")
    let session = URLSession.shared
    
    
    lazy var mySession = URLSession(configuration: configuration)
    let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10.0
        config.httpAdditionalHeaders = [
            "token": "someToken",
        ]
        return config
    }()
    
    private var urlConstructor: URLComponents = {
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.vk.com"
        
        return constructor
    }()
    
    func fetchUsers(){
        
        var constructor = urlConstructor
        
        constructor.path = "/method/friends.get"
        constructor.queryItems = [
            URLQueryItem(name: "user_id", value: String(Session.instance.userId)),
         //   URLQueryItem(name: "fields", value: "bdate"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = constructor.url else { return }
        
        let task = session.dataTask(with: url) { data, responce, error in
            if let responce = responce as? HTTPURLResponse {
                print(responce.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments)
            print(json)
        }
        
        task.resume()
    }
    
    func fetchPhotos(){
        
        var constructor = urlConstructor
        
        constructor.path = "/method/photos.getAll"
        constructor.queryItems = [
            URLQueryItem(name: "owner_id", value: String(Session.instance.userId)),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = constructor.url else { return }
        
        let task = session.dataTask(with: url) { data, responce, error in
            if let responce = responce as? HTTPURLResponse {
                print(responce.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments)
            print(json)
        }
        
        task.resume()
    }
    
    func fetchGroups(){
        
        var constructor = urlConstructor
        
        constructor.path = "/method/groups.get"
        constructor.queryItems = [
            URLQueryItem(name: "owner_id", value: String(Session.instance.userId)),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = constructor.url else { return }
        
        let task = session.dataTask(with: url) { data, responce, error in
            if let responce = responce as? HTTPURLResponse {
                print(responce.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments)
            print(json)
        }
        
        task.resume()
    }
    
    func fetchSearchGroups(query: String){
        
        var constructor = urlConstructor
    
        
        constructor.path = "/method/groups.search"
        constructor.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = constructor.url else { return }
        
        let task = session.dataTask(with: url) { data, responce, error in
            if let responce = responce as? HTTPURLResponse {
                print(responce.statusCode)
            }
            guard
                error == nil,
                let data = data
            else { return }
            
            let json = try? JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments)
            print(json)
        }
        
        task.resume()
    }
}
