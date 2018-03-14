//
//  RoleSelectViewController.swift
//  ZhiLieHui
//
//  Created by Haider Ace on 2018/3/14.
//  Copyright © 2018年 ZhiLieHui. All rights reserved.
//

import UIKit

class RoleSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        self.title = "身份选择"
        navigationController?.navigationBar.tintColor = StyleKit.buttonTextColor
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if navigationItem.backBarButtonItem == nil{
            let back = UIBarButtonItem()
            back.title = nil
            self.navigationItem.backBarButtonItem = back
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func hrSelected(_ sender: UIButton) {
        performSegue(withIdentifier: "pushToRegister", sender: "hr")
        
    }
    
    @IBAction func personSelected(_ sender: UIButton) {
        performSegue(withIdentifier: "pushToRegister", sender: "person")
        
    }
    
    @IBAction func companySelected(_ sender: UIButton) {
        performSegue(withIdentifier: "pushToRegister", sender: "company")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToRegister"{
            if let dest = segue.destination as? RegisterViewController{
                if let role = sender as? String{
                 dest.role = role
                }
            }
        }
    }

}
