//
//  User+CoreDataProperties.swift
//  ZhiLieHui
//
//  Created by Haider Ace on 2018/3/13.
//  Copyright © 2018年 ZhiLieHui. All rights reserved.
//
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var uid: String?
    @NSManaged public var mobile: String?
    @NSManaged public var real_name: String?
    @NSManaged public var nick_name: String?
    @NSManaged public var role: String?
    @NSManaged public var user_icon: String?

}
