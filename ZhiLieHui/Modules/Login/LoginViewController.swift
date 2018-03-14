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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if navigationItem.backBarButtonItem == nil{
         let back = UIBarButtonItem()
            back.title = nil
            self.navigationItem.backBarButtonItem = back
        }
    }
    
    func setUI(){
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 25
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 25
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = StyleKit.buttonColor.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func register(_ sender: UIButton) {
        self.performSegue(withIdentifier: "pushToRoleSelect", sender: nil)
    }
    
  
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
 

}
