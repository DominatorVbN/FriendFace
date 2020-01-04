//
//  FriendsViewModel.swift
//  FriendFace
//
//  Created by dominator on 04/01/20.
//  Copyright © 2020 dominator. All rights reserved.
//

import SwiftUI
import Combine

class FriendsListViewModel: ObservableObject {
    
    init() {
        fetchFriends()
    }
    
    @Published var friends: Friends = []
    var loadedFriends: Friends = []{
        didSet{
            self.friends = loadedFriends
        }
    }
    private func fetchFriends(){
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Invalid url")
        }
        
        Webservice().loadFriends(url: url) { friends in
            if let friends = friends{
                self.loadedFriends = friends
            }
        }
    }
    
    func search(text: String){
        if text.isEmpty{
            self.friends = loadedFriends
        }else{
            self.friends = friends.filter { $0.name.lowercased().contains(text.lowercased())}
        }
    }
    
}
