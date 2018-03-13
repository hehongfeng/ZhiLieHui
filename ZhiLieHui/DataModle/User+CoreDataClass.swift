//
//  User+CoreDataClass.swift
//  ZhiLieHui
//
//  Created by Haider Ace on 2018/3/13.
//  Copyright © 2018年 ZhiLieHui. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftyJSON

public class User: NSManagedObject {
    static let  classname = "User"
    class func create(uid:String,
                mobile:String?,
                real_name:String?,
                nick_name:String?,
                role:String?,
                user_icon:String?
                ) -> User {
        var object : User!
        let pred = NSPredicate(format: "uid = %@", argumentArray: [uid])
        if let old = (ApplicationData.sharedInstance.fetchRequest(entityName:User.classname, predicate:pred) as? [User])?.first {
            object = old
            print("update User \(old)")
        } else {
            object = ApplicationData.sharedInstance.createObject(entityName:User.classname) as? User
            print("crate new User \(uid)")
        }
        object.uid = uid
        object.mobile = mobile
        object.real_name = real_name
        object.nick_name = nick_name
        object.role = role
        object.user_icon = user_icon
        return object
    }
    func delete() {
        ApplicationData.sharedInstance.deleteObject(object: self)
    }
    
    class func deleteAllUsers() {
        if let allObjects = ApplicationData.sharedInstance.fetchRequest(entityName:User.classname, predicate:nil) as? [User] {
            for object in allObjects {
                object.delete()
            }
        }
    }
}

extension User{
    class func createFromJson(json:JSON)->User?{
        if let uid = json[0]["uid"].string{
         let user = User.create(uid: uid, mobile: nil, real_name: nil, nick_name: nil, role: nil, user_icon: nil)
            return user
        }else{
            NSLog("没有生成用户User")
            return nil
        }
    }
}

