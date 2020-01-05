//
//  ContentView.swift
//  FriendFace
//
//  Created by dominator on 04/01/20.
//  Copyright © 2020 dominator. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = FriendsListViewModel()
    @State  private var searchText = ""
    var body: some View {
        
        NavigationView{
            VStack{
                SearchBar(searchText: $searchText)
                List(model.friends.filter{$0.name.hasPrefix(searchText) || searchText == ""}) { (friend: FriendResponseModel) in
                    NavigationLink(destination: FriendDetail(friend: friend, model: self.model )){
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .font(.title)
                            Text(friend.email)
                                .font(.callout)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }.navigationBarTitle("Friends face")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
