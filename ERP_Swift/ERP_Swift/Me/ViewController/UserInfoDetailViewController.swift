//
//  UserInfoDetailViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/21.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class UserInfoDetailViewController: Basic1TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "个人信息"
    }
    
    override func loadData() {
        NetworkHelper.makePostRequest(baseUrl: SelectStaffDetail_API, parameters: [:], needRequestHeader: false, successHandler: { (resp) in

            let userModel = UserModel.init(json: resp["StaffInfo"])
            self.contentArray?.removeAllObjects()
            
            //第一组
            var arr = NSMutableArray.init()
            var model = PubNormalModel.init()
            model.title = "头像"
            model.desc = userModel.stfHeadPath
            model.dataType = .Image_OnlyShow
            model.showArrow = true
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "姓名"
            model.desc = userModel.stfName
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "性别"
            model.desc = userModel.isMale ? "男" : "女"
            arr.add(model)
            self.contentArray?.add(arr)
            
            //第二组
            arr = NSMutableArray.init()
            model = PubNormalModel.init()
            model.title = "员工编号"
            model.desc = userModel.staffNo
            arr.add(model)
            
            for (index, value) in userModel.posNames.enumerated() {
                print(value)
                model = PubNormalModel.init()
                model.title = String.init(format: "职位%d", index)
                model.desc = value as? String
                arr.add(model)
            }
            
            model = PubNormalModel.init()
            model.title = "电话号码"
            model.desc = userModel.phoneNum
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "邮箱"
            model.desc = userModel.email
            arr.add(model)
            self.contentArray?.add(arr)
            
            //第三组
            arr = NSMutableArray.init()
            model = PubNormalModel.init()
            model.title = "身份证号"
            model.desc = userModel.iDCardNo
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "户口类型"
            model.desc = userModel.isUrban ? "城镇户口" : "农村户口"
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "现居地址"
            model.desc = userModel.nowAddr
            model.showArrow = !(userModel.nowAddr.isEmpty)
            model.showContent = userModel.nowAddr
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "户籍地址"
            model.desc = userModel.iDCardAddr
            model.showArrow = !userModel.iDCardAddr.isEmpty
            model.showContent = userModel.iDCardAddr
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "民族"
            model.desc = userModel.nation
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "学历"
            model.desc = staffInfoEducationToStr(userModel.education)
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "婚姻状况"
            model.desc = userModel.isMarried ? "已婚" : "未婚"
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "有无子女"
            model.desc = userModel.isFertility ? "有" : "无"
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "健康状况"
            model.desc = userModel.health
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "QQ"
            model.desc = userModel.qQ
            arr.add(model)

            model = PubNormalModel.init()
            model.title = "微信"
            model.desc = userModel.weChat
            arr.add(model)
            
            model = PubNormalModel.init()
            model.title = "备注"
            model.desc = userModel.remark
            model.showArrow = !userModel.remark.isEmpty
            model.showContent = userModel.remark
            arr.add(model)
            
            self.contentArray?.add(arr)
            
            self.tableView?.reloadData()
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return (self.contentArray?.count)!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = self.contentArray?.object(at: section) as! NSArray
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let arr = self.contentArray?.object(at: indexPath.section) as? NSArray
        let model = arr?.object(at: indexPath.row) as? PubNormalModel
        
        if indexPath.section == 0 && indexPath.row == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: kTitleImageCellIdentifier) as? TitleImageCell
            if cell == nil {
                cell = TitleImageCell(style: UITableViewCellStyle.default, reuseIdentifier: kTitleImageCellIdentifier)
            }
            cell?.model = model
            cell?.rightImageView.cornerRadius = (cell?.rightImageView.height)! / 2.0
            return cell!
        } else {
            var cell = tableView.dequeueReusableCell(withIdentifier: kTitleArrowCellIdentifier) as? TitleArrowCell
            if cell == nil {
                cell = TitleArrowCell(style: UITableViewCellStyle.default, reuseIdentifier: kTitleArrowCellIdentifier)
            }
            cell?.model = model
            return cell!
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 80
        } else {
            return 45
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init()
        view.backgroundColor = UIColor.borderLineColor_0()
        return view
    }
    
}
