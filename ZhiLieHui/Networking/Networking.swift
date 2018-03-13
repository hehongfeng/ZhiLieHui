//
//  Networking.swift
//  ZhiLieHui
//
//  Created by Haider Ace on 2018/3/12.
//  Copyright © 2018年 ZhiLieHui. All rights reserved.
//

import UIKit

private let sharedManager = Networking()
class Networking: NSObject {
    //创建网络请求的单例
    class var sharedInstances: Networking {
        return sharedManager
    }
    
    override init() {
        super.init()
    }
}

