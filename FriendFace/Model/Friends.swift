//
//  Friends.swift
//  FriendFace
//
//  Created by dominator on 04/01/20.
//  Copyright © 2020 dominator. All rights reserved.
//

import SwiftUI

// MARK: - Friend
struct FriendResponseModel: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: Date
    let tags: [String]
    let friends: [FriendShortResponseModel]
}

// MARK: - FriendElement
struct FriendShortResponseModel: Codable, Identifiable {
    let id, name: String
}

typealias Friends = [FriendResponseModel]
