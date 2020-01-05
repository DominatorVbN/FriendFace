//
//  FriendDetail.swift
//  FriendFace
//
//  Created by dominator on 04/01/20.
//  Copyright © 2020 dominator. All rights reserved.
//

import SwiftUI

struct FriendDetail: View {
    let friend: FriendResponseModel
    let model: FriendsListViewModel
    var body: some View {
        ScrollView{
            VStack{
                VStack{
                    Image(systemName: "person.circle.fill")
                        .font(.largeTitle)
                        .padding(.top)
                    Text(friend.name)
                        .font(.title)
                    Text(friend.email)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .foregroundColor(.gray)
                        .background(LinearGradient(gradient: Gradient(colors: [
                            Color(UIColor.systemGroupedBackground),
                            Color.white,
                            Color(UIColor.systemGroupedBackground)
                        ]), startPoint: .leading, endPoint: .trailing)
                    ))
                    .padding(.top)
                
                Text(friend.about)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding()
                ForEach(friend.friends){ (shortFriend: FriendShortResponseModel) in
                    NavigationLink(destination: FriendDetail(friend: self.model.friends.first(where: {$0.id == shortFriend.id})!, model: self.model)) {
                        HStack{
                            Text(shortFriend.name)
                            Spacer()
                        }.padding(.horizontal)
                    }
                }
            }
        }.navigationBarTitle(Text(friend.name), displayMode: .inline)
    }
}

struct FriendDetail_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetail(friend: FriendResponseModel(id: "qw", isActive: true, name: "Amit", age: 12, company: "EB", email: "amit", address: "asfasf", about: "afssfas", registered: Date(), tags: ["asdf"], friends: []), model: FriendsListViewModel())
    }
}
