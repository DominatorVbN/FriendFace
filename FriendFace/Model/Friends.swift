//
//  Friends.swift
//  FriendFace
//
//  Created by dominator on 04/01/20.
//  Copyright © 2020 dominator. All rights reserved.
//

import SwiftUI

// MARK: - Friend
struct Friend: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: Date
    let tags: [String]
    let friends: [FriendShortModel]
}

// MARK: - FriendElement
struct FriendShortModel: Codable, Identifiable {
    let id, name: String
}

typealias Friends = [Friend]
