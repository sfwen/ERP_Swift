//
//  ViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/13.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import SwiftyJSON

class ViewController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadRightData()
        self.initTabbarUI()
        
//        NotificationCenter.default.post(name: NSNotification.Name(kUserLogOut), object: self, userInfo: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: kUserLogOut)))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /// 初始化tabbar 并绑定相应的control
    func initTabbarUI() -> Void {
        self.view.backgroundColor = UIColor.white
        self.tabBar.backgroundColor = UIColor.black
        
        let vc0 = MsgMainViewController()
        let vc1 = ContactMainViewController()
        let vc2 = WorkMainViewController()
        let vc3 = MeMainViewController()
        
//        vc0.tabBarItem = ESTabBarItem.init(title: "消息", image: UIImage.init(named: "tab_message_normal"), selectedImage: UIImage.init(named: "tab_message_normal"))
        let tabbarItem :ESTabBarItem = ESTabBarItem.init()
        tabbarItem.image = UIImage.init(named: "tab_message_normal")
        tabbarItem.selectedImage = UIImage.init(named: "tab_message_pressed")
        tabbarItem.title = "消息"
        vc0.tabBarItem = tabbarItem
        
        vc1.tabBarItem = ESTabBarItem.init(title: "通讯录", image: UIImage(named: "tab_address_book_normal"), selectedImage: UIImage(named: "tab_address_book_pressed"))
        vc2.tabBarItem = ESTabBarItem.init(title: "工作", image: UIImage(named: "tab_work_normal"), selectedImage: UIImage(named: "tab_work_pressed"))
        vc3.tabBarItem = ESTabBarItem.init(title: "我", image: UIImage(named: "tab_setting_normal"), selectedImage: UIImage(named: "tab_setting_pressed"))
        
        let nav0 = BasicNavigationController.init(rootViewController: vc0)
        let nav1 = BasicNavigationController.init(rootViewController: vc1)
        let nav2 = BasicNavigationController.init(rootViewController: vc2)
        let nav3 = BasicNavigationController.init(rootViewController: vc3)
        
        self.viewControllers = [nav0, nav1, nav2, nav3]
    }
    
    /// 加载用户权限
    func loadRightData() -> Void {
        NetworkHelper.makePostRequest(baseUrl: GetUserRole_API, parameters: [:], needRequestHeader: true, successHandler: { (resp) in
            let roleRights =  (JSON(resp["Role"].dictionaryValue)["RoleRights"])
            currUserRights = NSMutableSet()
            currUserRights?.add(Right_Public)
            for (_, subJson) : (String, JSON) in roleRights {
                let rightID = subJson["RightID"].rawString()
                currUserRights?.add(rightID!)
            }
        }, errorMsgHandler: { (error) in
            print(error)
        }) { (error) in
            print(error)
        }
    }
}

