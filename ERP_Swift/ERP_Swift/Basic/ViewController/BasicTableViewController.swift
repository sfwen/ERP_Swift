//
//  BasicTableViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/20.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable
import ESPullToRefresh

class BasicTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    /// 隐藏顶部的状态视图
    var isHiddenListHeaderView : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        self.loadData()
    }
    
    func loadData() -> Void {
        //网络请求
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.contentArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? BasicCell
        if cell == nil {
            cell = BasicCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    public lazy var queryPara : QueryPara? = {
        let queryPara = QueryPara.init(json: "")
        return queryPara
    }()
    
    private lazy var listHeaderView : ListHeaderView? = {
        let listHeaderView = ListHeaderView()
        listHeaderView.backgroundColor = UIColor.white
        listHeaderView.isHidden = self.isHiddenListHeaderView
        self.view.addSubview(listHeaderView)
        listHeaderView.snp.makeConstraints({ (make) in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(44)
        })
        return listHeaderView
    }()
    
    private lazy var tableView : UITableView? = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) in
            if self.isHiddenListHeaderView {
                make.top.equalTo(self.view)
            } else {
                make.top.equalTo((self.listHeaderView?.snp.bottom)!)
            }
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.view)
            make.right.equalTo(self.view)
        })
        
        tableView.es.addPullToRefresh {
            [unowned self] in
            self.queryPara?.StartIndex = 0
            self.loadData()
            self.tableView?.es.stopPullToRefresh(ignoreDate: true)
        }
        
        tableView.es.addInfiniteScrolling {
            [unowned self] in
            self.loadData()
            /// 如果你的加载更多事件成功，调用es_stopLoadingMore()重置footer状态
            self.tableView?.es.stopLoadingMore()
        }
        
        return tableView
    }()
    
    lazy var contentArray : NSMutableArray? = {
        var contentArray = NSMutableArray()
        return contentArray
    }()
    
    func handleRequestResult(_ data : NSArray) -> Void {
        if self.queryPara?.StartIndex == 0 {
            self.contentArray?.removeAllObjects()
            self.tableView?.es.resetNoMoreData()
        }
        if data.count > 0 {
            self.queryPara?.StartIndex = 1 + (self.queryPara?.StartIndex)!
            self.contentArray?.addObjects(from: data as! [Any])
        } else {
            self.tableView?.es.noticeNoMoreData()
        }
        self.tableView?.reloadData()
    }
}
