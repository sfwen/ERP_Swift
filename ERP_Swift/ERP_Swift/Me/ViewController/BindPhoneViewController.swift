//
//  BindPhoneViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/30.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

enum BindType : Int {
    case none = 0
    /// 绑定电话
    case Phone = 1
    /// 绑定设备
    case Device = 2
}

class BindPhoneViewController: UIViewController {
    var bindType : BindType = .none
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch bindType {
        case .Phone:
            self.title = "绑定手机号码"
            self.bindPhoneAction()
            break
        case .Device:
            self.title = "绑定手机设备"
            self.bindDeviceAction()
            break
        default: break
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 绑定设备
    func bindDeviceAction() -> Void {
        NetworkHelper.makePostRequest(baseUrl: CheckBindPhone_API, parameters: [:], needRequestHeader: false, successHandler: { (resp) in
            print(resp)
            let bindPhoneChg = resp["BindPhoneChg"].stringValue
            if !bindPhoneChg.isEmpty {
                self.iconImageView.image = UIImage.init(named: "bind_success")
                self.titleLabel.text = "变更中"
                self.titleLabel.textColor = UIColor.RGBColor(red: 80, green: 80, blue: 80)
                self.describeLabel.text = "变更申请正在审核中"
                self.opearButton?.setTitle("变更中", for: UIControlState.normal)
                self.opearButton?.backgroundColor = UIColor.lightGray
            } else {
                let bindDeviceTag = resp["DeviceTag"].stringValue
                if !bindDeviceTag.isEmpty {
                    self.iconImageView.image = UIImage.init(named: "bind_success")
                    self.titleLabel.text = "已绑定"
                    self.titleLabel.textColor = UIColor.RGBColor(red: 80, green: 80, blue: 80)
                    
                    let deviceTag = Tools().getUUID()
                    if bindDeviceTag == deviceTag {
                        //当前手机
                        self.describeLabel.text = "已绑定当前手机"
                        self.opearButton?.setTitle("已绑定", for: UIControlState.normal)
                        self.opearButton?.backgroundColor = UIColor.lightGray
                        self.opearButton?.isEnabled = false
                    } else {
                        //不是当前手机，可以申请变更
                        self.describeLabel.text = "已绑定手机,但不是绑定的当前手机"
                        self.opearButton?.setTitle("重新绑定为当前手机", for: UIControlState.normal)
                        self.opearButton?.backgroundColor = UIColor.RGBColor(red: 255, green: 128, blue: 28)
                        self.opearButton?.isEnabled = true
                    }
                } else {
                    //未绑定
                    self.iconImageView.image = UIImage.init(named: "not_bind")
                    self.titleLabel.text = "未绑定"
                    self.titleLabel.textColor = UIColor.RGBColor(red: 230, green: 74, blue: 60)
                    self.describeLabel.text = "绑定后可用绑定手机签到"
                    self.opearButton?.setTitle("绑定当前手机", for: UIControlState.normal)
                    self.opearButton?.isEnabled = true
                }
            }
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    
    /// 绑定手机号
    func bindPhoneAction() -> Void {
        if !(currUserInfo.User.phoneNum.isEmpty) {
            //已绑定手机
            self.iconImageView.image = UIImage.init(named: "bind_success")
            self.titleLabel.text = "已绑定"
            self.titleLabel.textColor = UIColor.RGBColor(red: 80, green: 80, blue: 80)
            self.describeLabel.text = "当前绑定手机号:" + currUserInfo.User.phoneNum
            self.opearButton?.setTitle("重新绑定", for: UIControlState.normal)
        } else {
            //未绑定
            self.iconImageView.image = UIImage.init(named: "not_bind")
            self.titleLabel.text = "未绑定"
            self.titleLabel.textColor = UIColor.RGBColor(red: 230, green: 74, blue: 60)
            self.describeLabel.text = "绑定后可用手机号登录及找回密码"
            self.opearButton?.setTitle("重新绑定", for: UIControlState.normal)
        }
    }
    
    @objc func bindEventAction() -> Void {
        if self.opearButton?.title(for: UIControlState.normal) == "绑定当前手机" {
            let deviceTag = Tools().getUUID()
            NetworkHelper.makePostRequest(baseUrl: BindPhoneAddNew_API, parameters: ["deviceTag" : deviceTag! as NSObject], needRequestHeader: false, successHandler: { (resp) in
                self.viewWillAppear(false)
            }, errorMsgHandler: { (error) in
                
            }, networkFailHandler: { (error) in
                
            })
        }
    }
    
    /// icon
    lazy var iconImageView : UIImageView = {
        let iconImageView = UIImageView.init()
        self.view.addSubview(iconImageView)
        iconImageView.snp.makeConstraints({ (make) in
            make.bottom.equalTo(self.view.snp.centerY).offset(-30)
            make.centerX.equalTo(self.view)
            make.width.height.equalTo(110)
        })
        
        return iconImageView
    }()
    
    /// 标题
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(22))
        titleLabel.textColor = UIColor.Color_Text_Black_0()
        titleLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view).offset(16);
            make.top.equalTo(self.iconImageView.snp.bottom).offset(14)
            make.right.equalTo(self.view).offset(-16);
        })
        return titleLabel
    }()
    
    /// 描述
    lazy var describeLabel : UILabel = {
        let describeLabel = UILabel()
        describeLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 1))
        describeLabel.textColor = UIColor.Color_Text_Gray_0()
        describeLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(describeLabel)
        describeLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.snp.bottom).offset(12);
            make.right.equalTo(self.titleLabel);
        })
        return describeLabel
    }()
    
    lazy var opearButton : UIButton? = {
        let button = UIButton.init(type: UIButtonType.custom)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.setTitle("绑定手机号", for: UIControlState.normal)
        button.cornerRadius = 4
        button.backgroundColor = UIColor.Color_Background_Orange()
        button.addTarget(self, action: #selector(bindEventAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        button.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view).offset(32)
            make.right.equalTo(self.view).offset(-32)
            make.top.equalTo(self.describeLabel.snp.bottom).offset(18)
            make.height.equalTo(44)
        })
        return button
    }()

}
