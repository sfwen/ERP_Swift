//
//  ProgressViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/6.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

typealias UpdateProgressViewControllerBlock = (_ height : CGFloat) -> Void
//typealias UpdateProgressViewControllerBlock = (_ height : NSNumber) -> Void

class ProgressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var contentArray : NSMutableArray! = NSMutableArray()
    var updateHeightBlock : UpdateProgressViewControllerBlock!
    var relateID : String!
    var catg : FlowCatg = FlowCatg.None

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.width = UIScreen.main.bounds.width
        // Do any additional setup after loading the view.
        
        self.tableView?.addObserver(self, forKeyPath: "contentSize", options: [.new, .old], context: nil)
        
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func loadData() -> Void {
        if self.relateID.isEmpty {
            return
        }
        
        NetworkHelper.makePostRequest(baseUrl: SelectFlowLogDetail_API, parameters: ["relateID" : self.relateID! as NSObject, "flowCatg" : (self.catg.hashValue as NSObject)], needRequestHeader: false, successHandler: { (resp) in
//            print(resp)
            let arr = resp["FlowLog"]["NodeLogs"].arrayValue.map({ (subJSON) -> FlowLogModel in
                let model = FlowLogModel(json: subJSON)
                return model
            })
            self.contentArray = NSMutableArray()
            self.contentArray?.addObjects(from: arr)
            self.tableView?.reloadData()
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    
    deinit {
        self.tableView?.removeObserver(self, forKeyPath: "contentSize")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.contentArray.count == 0 {
            return 0
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ProgressDetailCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ProgressDetailCell
        if cell == nil {
            cell = ProgressDetailCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.model = self.contentArray?.object(at: indexPath.row) as? FlowLogModel
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.contentArray?.object(at: indexPath.row) as? FlowLogModel
        if !((model?.handleDesc.isEmpty)!) {
            //32 42 80
            let h = model?.handleDesc.sf_heightForComment(fontSize: CGFloat(kTitileFont), width: CGFloat(self.view.width - 32 - 42 - 80))
            return 165 + h!
        }
        return 165
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let identifier = "ProgressBeginView"
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? ProgressBeginView
        if headerView == nil {
            headerView = ProgressBeginView.init(reuseIdentifier: identifier)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let identifier = "ProgressEndView"
        var footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? ProgressEndView
        if footerView == nil {
            footerView = ProgressEndView.init(reuseIdentifier: identifier)
        }
        
        return footerView
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "contentSize" && (object as! UITableView) == self.tableView) {
            let size = change![.newKey] as! CGSize
            self.view.height = size.height
            if self.updateHeightBlock != nil {
//                self.updateHeightBlock(NSNumber(value: Float(size.height)))
                self.updateHeightBlock(size.height + 64)
            }
        }
    }
    
    private lazy var tableView : UITableView? = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.tableHeaderView = self.tableHeaderView
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.right.equalTo(self.view)
        })
        
        return tableView
    }()
    
    private lazy var tableHeaderView : UIView = {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 50))
        headerView.backgroundColor = UIColor.white
        
        var line = UIView.init()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        headerView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(headerView)
            make.right.equalTo(headerView)
            make.height.equalTo(0.5)
            make.bottom.equalTo(headerView)
        }
        
        line = UIView.init()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        headerView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(headerView)
            make.right.equalTo(headerView)
            make.height.equalTo(0.5)
            make.top.equalTo(headerView)
        }
        
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 1))
        lab.textColor = UIColor.Color_Text_Black_0()
        lab.text = "流程信息"
        headerView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.left.equalTo(headerView).offset(16)
            make.right.equalTo(headerView).offset(-16)
            make.centerY.equalTo(headerView)
        })
        
        return headerView
    }()

}
