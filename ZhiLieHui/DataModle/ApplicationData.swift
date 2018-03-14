//
//  ApplicationData.swift
//  ZhiLieHui
//
//  Created by Haider Ace on 2018/3/12.
//  Copyright © 2018年 ZhiLieHui. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import SwiftyJSON

private let sharedManager = ApplicationData()

class ApplicationData: NSObject {
    //创建数据处理单例
    class var sharedInstance: ApplicationData {
        return sharedManager
    }
    
    //user related
    var currentUser:User? {
        didSet {
            let uId = currentUser?.uid
            UserDefaults.standard.set(uId, forKey: "defaultUserId")
            UserDefaults.standard.synchronize()
        }
    }
    
    private let dataModel:NSManagedObjectModel!
    private let context:NSManagedObjectContext!
    private let storeCoordinator:NSPersistentStoreCoordinator!
    override init() {
        dataModel = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectModel
        context = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext
        storeCoordinator = (UIApplication.shared.delegate as? AppDelegate)?.persistentStoreCoordinator
        super.init()
    }
    
    func fetchRequest(entityName:String,predicate: NSPredicate?) -> [NSManagedObject]? {
        
        var result: [NSManagedObject]?
        
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = NSEntityDescription.entity(forEntityName: entityName, in: self.context)
        if let pred = predicate {
            request.predicate = pred
        }
        
        do {
            result = try context.fetch(request) as? [NSManagedObject]
        }catch let error {
            print("can note load \(entityName) ---- error \(error)")
        }
        
        return result
    }
    
    func fetchRequest(entityName:String,sortDescriptor: NSSortDescriptor?) -> [NSManagedObject]? {
        
        var result: [NSManagedObject]?
        
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = NSEntityDescription.entity(forEntityName: entityName, in:self.context)
        
        if let sort = sortDescriptor {
            request.sortDescriptors = [sort]
        }
        
        do {
            result = try context.fetch(request) as? [NSManagedObject]
        }catch let error {
            print("can note load \(entityName) ---- error \(error)")
        }
        
        return result
    }
    
    func fetchRequest(entityName:String,predicate: NSPredicate?,sortDescriptor: NSSortDescriptor?, limited:Int? = nil) -> [NSManagedObject]? {
        
        var result: [NSManagedObject]?
        
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = NSEntityDescription.entity(forEntityName: entityName, in:self.context)
        if let pred = predicate {
            request.predicate = pred
        }
        
        if let sort = sortDescriptor {
            request.sortDescriptors = [sort]
        }
        
        if let count = limited {
            request.fetchLimit = count
        }
        
        do {
            result = try context.fetch(request) as? [NSManagedObject]
        }catch let error {
            print("can note load \(entityName) ---- error \(error)")
        }
        
        return result
    }
    
    func fetchRequest(entityName:String,predicate: NSPredicate?,sortDescriptors: [NSSortDescriptor]?, limited:Int? = nil) -> [NSManagedObject]? {
        
        var result: [NSManagedObject]?
        
        let request = NSFetchRequest<NSFetchRequestResult>()
        request.entity = NSEntityDescription.entity(forEntityName: entityName, in:self.context)
        if let pred = predicate {
            request.predicate = pred
        }
        
        if let sort = sortDescriptors {
            request.sortDescriptors = sort
        }
        
        if let count = limited {
            request.fetchLimit = count
        }
        
        do {
            result = try context.fetch(request) as? [NSManagedObject]
        }catch let error {
            print("can note load \(entityName) ---- error \(error)")
        }
        
        return result
    }
    
    
    func createObject(entityName:String) -> NSManagedObject {
        let object = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context)
        return object
    }
    
    func deleteObject(object:NSManagedObject) {
        context.delete(object)
    }
    
    func saveChanges() -> Bool {
        var success = false
        
        do {
            try context.save()
            success = true
        } catch let error {
            print("can not save context with error \(error)")
            success = false
        }
        
        if success == false {
            print("context rollback")
            context.rollback()
        }
        
        return success
    }
}

extension ApplicationData{
    func analysisRequest(data:JSON?) -> (Bool?,String?) {
        if let newData = data?["code"]{
            if newData == 200{
                return (true,"请求成功")
            }
        }
        return (false,"网络请求失败")
    }
}
extension ApplicationData{
    func userDidLogin() -> Bool {
        if currentUser != nil{
            return true
        }
        return false
    }
}
