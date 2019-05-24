//
//  SetViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/29.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class SetViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.tableView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.contentArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = self.contentArray?.object(at: section) as! NSArray
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        cell?.accessoryType = .disclosureIndicator
        let arr = self.contentArray?.object(at: indexPath.section) as! NSArray
        let dict = arr.object(at: indexPath.row) as! NSDictionary
        cell?.textLabel?.text = (dict["title"] as! String)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 {
            let vc = BindPhoneViewController()
            if row == 0 {
                vc.bindType = .Phone
            } else if row == 1 {
                vc.bindType = .Device
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @objc func logOutAction() -> Void {
        NotificationCenter.default.post(name: NSNotification.Name(kUserLogOut), object: self, userInfo: nil)
    }
    
    lazy var bottomView : UIView? = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        self.view.addSubview(view)
        view.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(60)
        })
        
        let logOutBtn = UIButton.init(type: UIButtonType.custom)
        logOutBtn.setTitle("退出登录", for: UIControlState.normal)
        logOutBtn.setTitleColor(UIColor.Color_Text_Orange(), for: UIControlState.normal)
        logOutBtn.addTarget(self, action: #selector(logOutAction), for: UIControlEvents.touchUpInside)
        view.addSubview(logOutBtn)
        logOutBtn.snp.makeConstraints({ (make) in
            make.left.equalTo(view)
            make.centerY.equalTo(view)
            make.right.equalTo(view)
            make.height.equalTo(44)
        })
        
        return view
    }()

    lazy var tableView : UITableView? = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(self.view)
            make.bottom.equalTo((self.bottomView?.snp.top)!)
            make.right.equalTo(self.view)
        })
        return tableView
    }()
    
    lazy var contentArray : NSMutableArray? = {
        let contentArray = NSMutableArray()
        
        //第一组
        var arr = NSMutableArray()
        var dict = NSMutableDictionary()
        dict.setValue("绑定手机号码", forKey: "title")
        arr.add(dict)
        
        dict = NSMutableDictionary()
        dict.setValue("绑定手机", forKey: "title")
        arr.add(dict)
        contentArray.add(arr)
        
        //第二组
        arr = NSMutableArray()
        dict = NSMutableDictionary()
        dict.setValue("修改密码", forKey: "title")
        arr.add(dict)
        contentArray.add(arr)
        
        return contentArray
    }()
}
