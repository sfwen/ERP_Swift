//
//  MsgMainViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/13.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON

class MsgMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "消息"
        self.reloadConunt()
    }
    
    func reloadConunt() -> Void {
        let queue = DispatchQueue(label: "com.Landing.ERP")
        DispatchQueue.global().async {
            queue.async {
                self.loadUnfinishedTasksData()
            }
            queue.async {
                self.loadWaitAcceptanceData()
            }
            queue.async {
                self.loadWaitRectificationData()
            }
            queue.async {
                self.loadNoticeData()
            }
            queue.async {
                self.loadNotepadData()
            }
            queue.async {
                self.loadSystemMessageData()
            }
        }
    }
    
    /// 加载未完成任务
    func loadUnfinishedTasksData() -> Void {
        NetworkHelper.makePostRequest(baseUrl: FlowSelectWaitHandleCount_API, parameters: [:], needRequestHeader: false, successHandler: { (resp) in
            let model = self.getObject(MainMessageType.UnfinishWork)
            let allTasksCount = resp["AllTasksCount"].intValue
            if allTasksCount == 0 {
                model.describe = "真棒，都处理完了！"
            } else {
                model.describe = resp["Desc"].stringValue
            }
            self.tableView.reloadData()
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    
    /// 加载待验收数据
    func loadWaitAcceptanceData() -> Void {
        let dict = ["AcptState" : "3"]
        let param = ["queryPara" : dict]
        NetworkHelper.makePostRequest(baseUrl: SelectMyAcptCount_API, parameters: param as [String : NSObject], needRequestHeader: false, successHandler: { (resp) in
            let model = self.getObject(MainMessageType.WaitAcceptance)
            model.describe = resp["Desc"].stringValue
            self.tableView.reloadData()
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    
    /// 待整改
    func loadWaitRectificationData() -> Void {
        let dict = ["RectifyState" : "2"]
        let param = ["queryPara" : dict]
        NetworkHelper.makePostRequest(baseUrl: SelectMyRectifyCount_API, parameters: param as [String : NSObject], needRequestHeader: false, successHandler: { (resp) in
            let model = self.getObject(MainMessageType.WaitRectification)
            model.describe = resp["Desc"].stringValue
            self.tableView.reloadData()
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    
    /// 加载最新通知
    func loadNoticeData() -> Void {
        let lastUpdatedTime = ""
        
        NetworkHelper.makePostRequest(baseUrl: NoticeCount_API, parameters: ["LastTime" : lastUpdatedTime as NSObject], needRequestHeader: false, successHandler: { (resp) in
            let model = self.getObject(MainMessageType.LatestNotif)
            model.describe = resp["Desc"].stringValue
            if (model.describe?.isEmpty)! {
                model.describe = "暂无最新通知"
            }
            self.tableView.reloadData()
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    
    /// 加载记事本
    func loadNotepadData() -> Void {
        NetworkHelper.makePostRequest(baseUrl: SelectNewstNotepad_API, parameters: [:], needRequestHeader: false, successHandler: { (resp) in
            let model = self.getObject(MainMessageType.Notepad)
            model.describe = JSON(resp["Notepad"].dictionaryValue)["Content"].stringValue
            self.tableView.reloadData()
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    
    /// 材料验收
    func loadMaterialAcceptanceData() -> Void {
//        let dict = ["RectifyState" : "2"]
//        let param = ["queryPara" : dict]
    }
    
    /// 查询消息数量
    func loadSystemMessageData() -> Void {
        NetworkHelper.makePostRequest(baseUrl: SelectSysMsgCount_API, parameters: [:], needRequestHeader: false, successHandler: { (resp) in
            let model = self.getObject(MainMessageType.SystemMessage)
            model.describe = resp["ReturnData"].stringValue
            self.tableView.reloadData()
        }, errorMsgHandler: { (error) in
            print(error)
        }) { (error) in
            print(error)
        }
    }
    
    /// 获取相应的model
    ///
    /// - Parameter mainMessageType: 枚举
    /// - Returns: MainMessageModel
    func getObject(_ mainMessageType : MainMessageType) -> MainMessageModel {
        for model in self.contentArray {
            let obj : MainMessageModel = model as! MainMessageModel
            if obj.mainMessageType == mainMessageType {
                return obj
            }
        }
        return MainMessageModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "MsgMainCell"
        var cell : MsgMainCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? MsgMainCell
        if cell == nil {
            cell = MsgMainCell(style: .default, reuseIdentifier: identifier)
        }
        
        let row = indexPath.row
        cell.model = self.contentArray.object(at: row) as? MainMessageModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        UntreatedWorkViewController
        var vc : UIViewController //= TestAliViewController()
        let model = self.contentArray.object(at: indexPath.row) as? MainMessageModel
        switch model?.mainMessageType {
        case .UnfinishWork?:
            vc = UntreatedWorkViewController()
        case .HaveFinished?:
            let vc0 = WorkListViewController()
            vc0.workListCtrlType = .MyDone
            vc0.isHiddenListHeaderView = true
            vc = vc0
        case .MyProcess?:
                vc = MyWorkFlowListViewController()
        default:
            vc = UIViewController()
        }
        
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    lazy var tableView : UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.right.equalTo(self.view)
        })
        return tableView
    }()
    
    lazy var contentArray : NSMutableArray = {
        let contentArray = NSMutableArray.init()
        
        var model : MainMessageModel = MainMessageModel()
        model.icon = "icon_untreat"
        model.title = "未处理任务"
        model.unreadCount = "0"
        model.mainMessageType = MainMessageType.UnfinishWork
        contentArray.add(model)
        
        model = MainMessageModel()
        model.icon = "discuss_notification"
        model.title = "系统消息"
        model.unreadCount = "0"
        model.mainMessageType = MainMessageType.SystemMessage
        contentArray.add(model)
        
        model = MainMessageModel()
        model.icon = "icon_untreat"
        model.title = "工地验收"
        model.unreadCount = "0"
        model.mainMessageType = MainMessageType.WaitAcceptance
        contentArray.add(model)
        
        model = MainMessageModel()
        model.icon = "icon_untreat"
        model.title = "工地整改"
        model.unreadCount = "0"
        model.mainMessageType = MainMessageType.WaitRectification
        contentArray.add(model)
        
        model = MainMessageModel()
        model.icon = "discuss_mission"
        model.title = "已处理任务"
        model.unreadCount = "0"
        model.mainMessageType = MainMessageType.HaveFinished
        model.describe = "查看…"
        contentArray.add(model)
        
        model = MainMessageModel()
        model.icon = "discuss_workflow"
        model.title = "我的流程"
        model.unreadCount = "0"
        model.mainMessageType = MainMessageType.MyProcess
        model.describe = "查看…"
        contentArray.add(model)
        
        model = MainMessageModel()
        model.icon = "discuss_notification"
        model.title = "最新通知"
        model.unreadCount = "0"
        model.mainMessageType = MainMessageType.LatestNotif
        contentArray.add(model)
        
        model = MainMessageModel()
        model.icon = "msg_comment"
        model.title = "记事本"
        model.unreadCount = "0"
        model.mainMessageType = MainMessageType.Notepad
        contentArray.add(model)
        
        return contentArray
    }()

}
