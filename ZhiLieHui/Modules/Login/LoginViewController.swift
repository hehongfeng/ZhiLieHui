//
//  LoginViewController.swift
//  ZhiLieHui
//
//  Created by Haider Ace on 2018/3/14.
//  Copyright © 2018年 ZhiLieHui. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var visitorBtn: UIButton!
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var forgetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        

        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 15
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 15
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = StyleKit.buttonColor.cgColor
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
