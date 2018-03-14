//
//  StyleKit.swift
//  ZhiLieHui
//
//  Created by Haider Ace on 2018/3/13.
//  Copyright © 2018年 ZhiLieHui. All rights reserved.
//

import UIKit
import Foundation

public class StyleKit: NSObject {
    private struct Cache {
        static var defaultTint: UIColor = UIColor(hexString: "#002050")
        static var red1: UIColor = UIColor(hexString: "#C83E18")
        static var barTextColor = UIColor(hexString: "#E3E4E6")
        static var gray1 = UIColor(hexString: "#909798")
        static var gray2 = UIColor(hexString: "#CACFD0")
        static var gray3 = UIColor(hexString: "#A2A2A2")
        static var gray4 = UIColor(hexString: "#F7F7F7")
        static var gray5 = UIColor(hexString: "#CCCFD3")
        static var gray6 = UIColor(hexString: "#686D6D")
        static var gray7 = UIColor(hexString: "#757A82")
        static var gray8 = UIColor(hexString: "#9CA4B1")
        static var gray9 = UIColor(hexString: "#8E8E93")
        static var gray10 = UIColor(hexString: "#41464D")
        
        static var green1 = UIColor(hexString: "#209189")
        static var green2 = UIColor(hexString: "#42bc55")
        
        static var red2 = UIColor(hexString: "#B92A13")
        
        static var blue1 = UIColor(hexString: "#1A3241")
        static var blue2 = UIColor(hexString: "#F2F2F5")
        static var blue3 = UIColor(hexString:"#2D9FFF")

        
        
        static var white1 = UIColor(hexString: "#FFFFFF")
        
        static var black1 = UIColor(hexString: "#000000")
        static var black2 = UIColor(hexString: "#000000bc")
        static var black3 = UIColor(hexString: "#838685")

        
    }
    public class var barButtonColor: UIColor { return Cache.white1 }
    public class var tabBarTintColor: UIColor {return Cache.green2 }
    public class var navigationBarTintColor: UIColor { return Cache.blue2 }
    public class var navigationBarTitleTextAttributesColor:UIColor { return Cache.white1 }
    public class var buttonColor:UIColor {return Cache.blue3}
    public class var buttonTextColor:UIColor {return Cache.black3}    
}
