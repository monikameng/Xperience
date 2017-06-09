//
//  ViewController.swift
//  Xperience
//
//  Created by 孟琦 on 6/8/17.
//  Copyright © 2017 Xperience. All rights reserved.
//

import UIKit

let FONT = UIFont(name: "HelveticaNeue-Light", size: 15)
let WarningFont = UIFont(name: "HelveticaNeue-Light", size: 10)
let COLORORANGE = UIColor.init(red: 242/255, green: 170/255, blue: 68/255, alpha: 1)

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var mainBodyView: UIView!
    let logoImage = UIImageView()
    let warningLabel = UILabel()
    let usernameBg = UIImageView()
    let usernameText = UITextField()
    let pswdBg = UIImageView()
    let pswdText = UITextField()
    let loginBg = UIImageView()
    let loginButton = UIButton()
    let signupButton = UIButton()
    let wechatlogo = UIImageView()
    let wechatButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // format logo
        logoImage.frame = CGRect(x: UIScreen.main.bounds.width/2-150, y: 20, width: 300, height: 300)
        logoImage.image = #imageLiteral(resourceName: "logo")
        logoImage.contentMode = .scaleAspectFit
        mainBodyView.addSubview(logoImage)
        
        // format warning label
        warningLabel.frame = CGRect(x: UIScreen.main.bounds.width/2-110, y: UIScreen.main.bounds.height/2-20, width: 220, height: 20)
        warningLabel.textColor = UIColor.red
        warningLabel.textAlignment = .center
        warningLabel.font = WarningFont
        mainBodyView.addSubview(warningLabel)
        
        // format username
        usernameBg.frame = CGRect(x: UIScreen.main.bounds.width/2-110, y: UIScreen.main.bounds.height/2, width: 220, height: 25)
        usernameBg.image = #imageLiteral(resourceName: "loginbar")
        usernameText.frame = CGRect(x: UIScreen.main.bounds.width/2-110, y: UIScreen.main.bounds.height/2, width: 220, height: 25)
        usernameText.backgroundColor = UIColor.clear
        usernameText.text = "用户名"
        usernameText.textAlignment = .center
        usernameText.font = FONT
        usernameText.textColor = UIColor.lightGray
        usernameText.delegate = self
        mainBodyView.addSubview(usernameBg)
        mainBodyView.addSubview(usernameText)
        
        // format password
        pswdBg.frame = CGRect(x: UIScreen.main.bounds.width/2-110, y: UIScreen.main.bounds.height/2+10+25, width: 220, height: 25)
        pswdBg.image = #imageLiteral(resourceName: "loginbar")
        pswdText.frame = CGRect(x: UIScreen.main.bounds.width/2-110, y: UIScreen.main.bounds.height/2+10+25, width: 220, height: 25)
        pswdText.backgroundColor = UIColor.clear
        pswdText.text = "密码"
        pswdText.textAlignment = .center
        pswdText.font = FONT
        pswdText.textColor = UIColor.lightGray
        pswdText.delegate = self
        mainBodyView.addSubview(pswdBg)
        mainBodyView.addSubview(pswdText)
        
        // format login button
        loginBg.frame = CGRect(x: UIScreen.main.bounds.width/2-110, y: UIScreen.main.bounds.height/2+20+50, width: 220, height: 25)
        loginBg.image = #imageLiteral(resourceName: "login")
        loginButton.frame = CGRect(x: UIScreen.main.bounds.width/2-110, y: UIScreen.main.bounds.height/2+20+50, width: 220, height: 25)
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.titleLabel?.textAlignment = .center
        loginButton.titleLabel?.font = FONT
        loginButton.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        mainBodyView.addSubview(loginBg)
        mainBodyView.addSubview(loginButton)
        
        // format sign up button
        signupButton.frame = CGRect(x: UIScreen.main.bounds.width/2-110, y: UIScreen.main.bounds.height/2+30+75, width: 220, height: 25)
        signupButton.setTitle("注册", for: .normal)
        signupButton.setTitleColor(COLORORANGE, for: .normal)
        signupButton.titleLabel?.textAlignment = .center
        signupButton.titleLabel?.font = FONT
        signupButton.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        mainBodyView.addSubview(signupButton)
        
        
        // format wechat logo
        wechatlogo.frame = CGRect(x: UIScreen.main.bounds.width/2-100, y: UIScreen.main.bounds.height/2+40+100+10, width: 25, height: 25)
        wechatlogo.image = #imageLiteral(resourceName: "wechatLogin")
        wechatlogo.contentMode = .scaleAspectFit
        mainBodyView.addSubview(wechatlogo)
        
        // format wechat button
        wechatButton.frame = CGRect(x: UIScreen.main.bounds.width/2-110, y: UIScreen.main.bounds.height/2+40+100+10, width: 220, height: 25)
        wechatButton.setTitle("微信登录", for: .normal)
        wechatButton.tintColor = UIColor.clear
        wechatButton.setTitleColor(COLORORANGE, for: .normal)
        wechatButton.titleLabel?.textAlignment = .center
        wechatButton.titleLabel?.font = FONT
        wechatButton.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        mainBodyView.addSubview(wechatButton)
        
        // Function to disable keyboard upon touching anywhere else
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func ButtonTapped(sender: UIButton) {
        if (sender == loginButton) {
            if (usernameText.text == "" || usernameText.text == "用户名") {
                warningLabel.text = "用户名／密码错误"
                return
            }
            self.dismiss(animated: false, completion: nil)
        }
        
        if (sender == signupButton) {
            self.performSegue(withIdentifier: "showSignUp", sender: nil)
        }
        
        if (sender == wechatButton) {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Function to disable keyboard (called in viewDidLoad())
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        textField.textColor = COLORORANGE
        warningLabel.text = ""
    }

    
}

