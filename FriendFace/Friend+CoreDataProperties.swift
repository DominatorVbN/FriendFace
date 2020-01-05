//
//  Friend+CoreDataProperties.swift
//  FriendFace
//
//  Created by dominator on 05/01/20.
//  Copyright © 2020 dominator. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var shortFriend: NSSet?

}

// MARK: Generated accessors for shortFriend
extension Friend {

    @objc(addShortFriendObject:)
    @NSManaged public func addToShortFriend(_ value: FriendShortModel)

    @objc(removeShortFriendObject:)
    @NSManaged public func removeFromShortFriend(_ value: FriendShortModel)

    @objc(addShortFriend:)
    @NSManaged public func addToShortFriend(_ values: NSSet)

    @objc(removeShortFriend:)
    @NSManaged public func removeFromShortFriend(_ values: NSSet)

}
