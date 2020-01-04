//
//  Webservice.swift
//  FriendFace
//
//  Created by dominator on 04/01/20.
//  Copyright © 2020 dominator. All rights reserved.
//

import Foundation

class Webservice {
    
    func loadFriends(url: URL, completion: @escaping (Friends?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response = try? decoder.decode(Friends.self, from: data)
            if let response = response {
                DispatchQueue.main.async {
                    completion(response)
                }
            }
            
        }.resume()
        
    }
    
}
