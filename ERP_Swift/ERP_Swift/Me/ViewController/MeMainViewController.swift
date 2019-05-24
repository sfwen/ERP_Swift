//
//  MeMainViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/13.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

enum MyCellType : Int {
    case none = 0
    /// 请假
    case AskLeave = 1
    /// 调休
    case DayOff = 2
    /// 外出
    case GoOut = 3
    /// 考勤
    case Attendance
    /// 奖惩
    case PrizeInfo
    /// 工资卡
    case WageCard
    /// 设置
    case Setting
    /// 下载地址
    case DownloadAddress
}

class MeMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "我"
        self.view.backgroundColor = UIColor.white
        self.tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 + (self.contentArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            let count = (self.contentArray?.object(at: section - 1) as! NSArray).count
            return count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0 {
            let identifier = "MeHeaderCell"
            var cell : MeHeaderCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? MeHeaderCell
            if cell == nil {
                cell = MeHeaderCell(style: .default, reuseIdentifier: identifier)
            }
            cell?.loadData()
            return cell!
        } else {
            let identifier = "LeftRightCell"
            var cell : LeftRightCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? LeftRightCell
            if cell == nil {
                cell = LeftRightCell(style: .default, reuseIdentifier: identifier)
            }
            let arr = self.contentArray?.object(at: section - 1) as! NSArray
            cell?.model = (arr.object(at: indexPath.row) as! NSDictionary)
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var h : Float = 0.0
        if indexPath.section == 0 {
            h = 88.0
        } else {
            h = 54.0
        }
        return CGFloat(h)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init()
        
        var line = UIView.init()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
       view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.height.equalTo(0.5)
            make.bottom.equalTo(view)
        }
        
        line = UIView.init()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.height.equalTo(0.5)
            make.top.equalTo(view)
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        if section == 0 {
            let vc = UserInfoDetailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let arr = self.contentArray?.object(at: section - 1) as! NSArray
            let dict = arr.object(at: indexPath.row) as! NSDictionary
            let tag = dict["tag"] as! MyCellType
            switch tag {
            case .Setting: do {
                let vc = SetViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
                break
            default:
                break
            }
        }
        
    }
    
    
    lazy var tableView : UITableView? = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.right.equalTo(self.view)
        })
        return tableView
    }()
    
    lazy var contentArray : NSMutableArray? = {
        let contentArray = NSMutableArray()
        
        //第二组
        var arr = NSMutableArray()
        var dict = NSMutableDictionary()
        dict.setValue("请假申请", forKey: "image")
        dict.setValue("请假申请", forKey: "title")
        arr.add(dict)
        
        dict = NSMutableDictionary()
        dict.setValue("调休申请", forKey: "image")
        dict.setValue("调休申请", forKey: "title")
        arr.add(dict)
        
        dict = NSMutableDictionary()
        dict.setValue("外出申请", forKey: "image")
        dict.setValue("外出申请", forKey: "title")
        arr.add(dict)
        contentArray.add(arr)
        
        //第三组
        arr = NSMutableArray()
        dict = NSMutableDictionary()
        dict.setValue("考勤记录", forKey: "image")
        dict.setValue("考勤记录", forKey: "title")
        arr.add(dict)
        
        dict = NSMutableDictionary()
        dict.setValue("奖惩记录", forKey: "image")
        dict.setValue("奖惩记录", forKey: "title")
        arr.add(dict)
        
        dict = NSMutableDictionary()
        dict.setValue("银行账户", forKey: "image")
        dict.setValue("工资卡", forKey: "title")
        arr.add(dict)
        contentArray.add(arr)
        
        //第四组
        arr = NSMutableArray()
        dict = NSMutableDictionary()
        dict.setValue("设置", forKey: "image")
        dict.setValue("设置", forKey: "title")
        dict.setValue(MyCellType.Setting, forKey: "tag")
        arr.add(dict)
        contentArray.add(arr)
        
        //第五组
        arr = NSMutableArray()
        dict = NSMutableDictionary()
        dict.setValue("分享下载地址", forKey: "image")
        dict.setValue("下载地址", forKey: "title")
        arr.add(dict)
        contentArray.add(arr)
        
        return contentArray
    }()
}
