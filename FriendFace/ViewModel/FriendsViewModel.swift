//
//  FriendsViewModel.swift
//  FriendFace
//
//  Created by dominator on 04/01/20.
//  Copyright © 2020 dominator. All rights reserved.
//

import SwiftUI
import Combine
import CoreData

class FriendsListViewModel: ObservableObject {
    
    init() {
        fetchFriends()
    }
    
    @Published var friends: Friends = []
    private func fetchFriends(){
        guard let viewContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("view context not found!")
        }
        let fd: NSFetchRequest<Friend> = Friend.fetchRequest()
        if let result = try? viewContext.fetch(fd){
            if result.count > 0{
                self.friends = result.map({ friend in
                    let emptyArray: [FriendShortModel] = []
                    let set = friend.shortFriend ?? NSSet(array: emptyArray)
                    let array = set.allObjects as! [FriendShortModel]
                    let friends = array.map({ (shortFriend: FriendShortModel) in
                        FriendShortResponseModel(id: friend.id ?? UUID().uuidString, name: friend.name ?? "N/A")
                        
                    })
                    return FriendResponseModel(id: friend.id ?? UUID().uuidString, isActive: friend.isActive, name: friend.name ?? "N/A", age: Int(friend.age), company: friend.company ?? "N/A", email: friend.email ?? "N/A", address: friend.address ?? "N/A", about: friend.about ?? "N/A", registered: friend.registered ?? Date(), tags: [], friends: friends)
                   
                })
                return
            }
        }
        
            
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            fatalError("Invalid url")
        }
        
        Webservice().loadFriends(url: url) { friends in
            if let friends = friends{
                self.saveToCoreDate(friends)
            }
        }
    }
    
    func saveToCoreDate(_ friends: Friends){
        guard let viewContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            fatalError("view context not found!")
        }
        friends.forEach { friend in
            let newFriend = Friend(context: viewContext)
            newFriend.name = friend.name
            newFriend.about = friend.about
            newFriend.address = friend.address
            newFriend.age = Int16(friend.age)
            newFriend.company = friend.company
            newFriend.email = friend.email
            newFriend.id = friend.id
            newFriend.registered = friend.registered
            newFriend.isActive = friend.isActive
            newFriend.shortFriend = NSSet(array: friend.friends.map({ shortFriend in
                let newShortFriend = FriendShortModel(context: viewContext)
                newShortFriend.id = shortFriend.id
                newShortFriend.name = shortFriend.name
                return newShortFriend
            }))
        }
        viewContext.mergePolicy = NSMergePolicy.overwrite
        try? viewContext.save()
        self.friends = friends
    }
}
