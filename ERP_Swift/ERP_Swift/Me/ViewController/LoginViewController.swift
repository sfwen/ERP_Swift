//
//  LoginViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/13.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SnapKit
import Device
import SwiftyJSON

class LoginViewController: UIViewController {

    var headerImageView :UIImageView?
    var accountTextField :UITextField?
    var passwordTextField :UITextField?
    var loginButton :UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let userCookies = UserDefaults.standard.object(forKey: "userCookies")
//        print(userCookies as Any)
//        
//        let info = Tools().readInfo()
//        let currUserInfo = CurrUserInfo.init(json: JSON(info))
//        print(currUserInfo.user.name as Any)
//        print(currUserInfo.userPoss[0].coName as Any)
    }
    
    func initUI() -> Void {
        headerImageView = UIImageView.init(image: UIImage.init(named: "logo"))
        headerImageView?.layer.cornerRadius = 45
        headerImageView?.layer.masksToBounds = true
        self.view.addSubview(headerImageView!)
        headerImageView?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(90)
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(64)
        })
        
        let topLine = UIView.init()
        if #available(iOS 11.0, *) {
            topLine.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            topLine.backgroundColor = UIColor.borderLineColor_0()
        }
        self.view.addSubview(topLine)
        topLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(0.5)
            make.top.equalTo((headerImageView?.snp.bottom)!).offset(30)
        }
        
        let leftImageView = UIImageView.init()
        leftImageView.image = UIImage.init(named: "login_user_gray")
        leftImageView.contentMode = UIViewContentMode.center
        self.view.addSubview(leftImageView)
        leftImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view).offset(8)
            make.top.equalTo(topLine.snp.bottom)
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
        
        accountTextField = UITextField.init()
        accountTextField?.placeholder = "账号"
//        accountTextField.le
        accountTextField?.font = UIFont.systemFont(ofSize: 17)
        if #available(iOS 11.0, *) {
            accountTextField?.textColor = UIColor.init(named: "Color_Text_Black_0")
        } else {
            // Fallback on earlier versions
            accountTextField?.textColor = UIColor.Color_Text_Black_0()
        }
        self.view.addSubview(accountTextField!)
        accountTextField?.snp.makeConstraints({ (make) in
            make.left.equalTo(leftImageView.snp.right).offset(8)
            make.right.equalTo(self.view).offset(-16)
            make.top.equalTo(topLine.snp.bottom)
            make.height.equalTo(44)
        })
        
        
        let middleLine = UIView.init()
        if #available(iOS 11.0, *) {
            middleLine.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            middleLine.backgroundColor = UIColor.borderLineColor_0()
        }
        self.view.addSubview(middleLine)
        middleLine.snp.makeConstraints { (make) in
            make.left.equalTo(accountTextField!)
            make.right.equalTo(self.view)
            make.height.equalTo(topLine)
            make.top.equalTo((accountTextField?.snp.bottom)!)
        }
        
        let rightImageView = UIImageView.init()
        rightImageView.image = UIImage.init(named: "login_password_gray")
        rightImageView.contentMode = UIViewContentMode.center
        self.view.addSubview(rightImageView)
        rightImageView.snp.makeConstraints { (make) in
            make.left.equalTo(leftImageView)
            make.top.equalTo(middleLine.snp.bottom)
            make.height.right.equalTo(leftImageView)
        }
        
        passwordTextField = UITextField.init()
        if #available(iOS 11.0, *) {
            passwordTextField?.textColor = UIColor.init(named: "Color_Text_Black_0")
        } else {
            // Fallback on earlier versions
            passwordTextField?.textColor = UIColor.Color_Text_Black_0()
        }
        passwordTextField?.placeholder = "密码"
        passwordTextField?.isSecureTextEntry = true
        self.view.addSubview(passwordTextField!)
        passwordTextField?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(accountTextField!)
            make.height.equalTo(accountTextField!)
            make.top.equalTo(rightImageView)
        })
        
        let bottomLine = UIView.init()
        if #available(iOS 11.0, *) {
            bottomLine.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            bottomLine.backgroundColor = UIColor.borderLineColor_0()
        }
        self.view.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(topLine)
            make.top.equalTo(rightImageView.snp.bottom)
        }
        
        loginButton = UIButton.init(type: UIButtonType.custom)
        if #available(iOS 11.0, *) {
            loginButton?.backgroundColor = UIColor.init(named: "Color_Background_Orange")
        } else {
            // Fallback on earlier versions
            loginButton?.backgroundColor = UIColor.Color_Background_Orange()
        }
        loginButton?.setTitle("登录", for: UIControlState.normal)
        loginButton?.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginButton?.layer.cornerRadius = 4
        loginButton?.addTarget(self, action: #selector(loginAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loginButton!)
        loginButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view).offset(16)
            make.right.equalTo(self.view).offset(-16)
            make.top.equalTo(bottomLine.snp.bottom).offset(20)
            make.height.equalTo(40)
        })
    }
    
    //MARK:Action 方法
    @objc func loginAction() -> Void {
        //登录
        if (accountTextField?.text?.isEmpty)! {
            return
        }
        if (passwordTextField?.text?.isEmpty)! {
            return
        }
        NetworkHelper.goToLogin(userName: (accountTextField?.text)!, password: (passwordTextField?.text)!, completionHandler: { (resp) in
            let currUserInfo = CurrUserInfo.init(json: JSON(resp))
            if currUserInfo.UserPoss.count > 1 {
                
            } else if currUserInfo.UserPoss.count == 1 {
                currUserInfo.Session.LoginStafPosID = currUserInfo.UserPoss[0].ID
                self.loginSuccess(currUserInfo: currUserInfo)
            } else {
                self.loginSuccess(currUserInfo: currUserInfo)
            }
        }, errorHandler: { (error) in
            print(error)
        }) { (error) in
            print("aa")
            print(error)
        }
    }
    
    func loginSuccess(currUserInfo : CurrUserInfo) -> Void {
        Tools().saveInfo(info: currUserInfo.mapString()!)
        NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: kUserLogin)))
    }
}
