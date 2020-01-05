//
//  FriendShortModel+CoreDataProperties.swift
//  FriendFace
//
//  Created by dominator on 05/01/20.
//  Copyright © 2020 dominator. All rights reserved.
//
//

import Foundation
import CoreData


extension FriendShortModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendShortModel> {
        return NSFetchRequest<FriendShortModel>(entityName: "FriendShortModel")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: Friend?

}
