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
        
        if ApplicationData.sharedInstance.userDidLogin() == false {
            showLogin()
        }
        self.delegate = self
        
        self.updateTabsBaseOnUserStatus()
        
        
        // Do any additional setup after loading the view.
    }
    
    func showLogin(){
        DispatchQueue.main.async {
            for vc in (self.viewControllers as? [UINavigationController])! {
                vc.popToRootViewController(animated: false)
            }
            
            self.selectedIndex = 0
            self.performSegue(withIdentifier: "startToLogin", sender: nil)
        }
        
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
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   
        if segue.identifier == "startToLogin"{
            guard let dest = segue.destination as? UINavigationController else{return}
            guard let login = dest.viewControllers.first as? LoginViewController else{return}
            login.navigationController?.navigationBar.isHidden = true
        }
    }
}

extension TCTabBarViewController:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if ApplicationData.sharedInstance.userDidLogin() {
            return true
        }
        showLogin()
        return false
    }
}
