//
//  RegisterViewController.swift
//  ZhiLieHui
//
//  Created by Haider Ace on 2018/3/14.
//  Copyright © 2018年 ZhiLieHui. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    var role = String()
    @IBOutlet weak var verificationBtn: UIButton!
    @IBOutlet weak var enterBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        verificationBtn.layer.masksToBounds = true
        verificationBtn.layer.cornerRadius = 13
        enterBtn.layer.masksToBounds = true
        enterBtn.layer.cornerRadius = 5
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
