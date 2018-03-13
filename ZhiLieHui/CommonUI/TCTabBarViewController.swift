//
//  TCTabBarViewController.swift
//  ZhiLieHui
//
//  Created by Haider Ace on 2018/3/13.
//  Copyright © 2018年 ZhiLieHui. All rights reserved.
//

import UIKit

class TCTabBarViewController: UITabBarController {

    let home = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()
    let serve = UIStoryboard(name: "Serve", bundle: nil).instantiateInitialViewController()
    let setting = UIStoryboard(name: "Setting", bundle: nil).instantiateInitialViewController()
    let apply = UIStoryboard(name: "Apply", bundle: nil).instantiateInitialViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.tintColor = StyleKit.barButtonColor
//        self.tabBar.isTranslucent = false

//        if let items = self.tabBar.items {
//            for item in items {
//                item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor(hexString: "#999999")], for: UIControlState.normal)
//                item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:StyleKit.navigationBarTintColor], for: UIControlState.selected)
//            }
//        }
        self.delegate = self as? UITabBarControllerDelegate
        
        self.updateTabsBaseOnUserStatus()
        
        
        // Do any additional setup after loading the view.
    }
    
    func updateTabsBaseOnUserStatus() {
        //        if let vcs = self.viewControllers {
        //            let onboard = ApplicationData.sharedInstance.userDidOnBoard()
        //            for vc in vcs {
        //                if let nvc = vc as? UINavigationController {
        //                    for vcc in nvc.viewControllers {
        //                        if onboard && vcc.isKindOfClass(DashboardViewController) {
        //                            return
        //                        } else if !onboard && vcc.isKindOfClass(HomeViewController) {
        //                            return
        //                        }
        //                    }
        //                }
        //            }
        //        }
        
        print("***** did reset tabs ****")
//        if ApplicationData.sharedInstance.userDidOnBoard() {
        self.setViewControllers([home!,serve!,setting!], animated:false)
//        } else {
//            self.setViewControllers([home!,apply!,setting!], animated:false)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
