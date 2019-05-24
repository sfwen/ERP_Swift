//
//  BasicDetailViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/6.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

enum ShowHeaderButtonType : Int {
    /// 不展示
    case None = 0
    /// 电话
    case Phone
    /// 位置
    case Location
}


class BasicDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    private var progressVC : ProgressViewController?
    private var tableViewContentHeight : CGFloat!
    private var progressTableViewContentHeight : CGFloat = 0
    var contentArray : NSMutableArray = NSMutableArray.init()
    
    /// 查询的ID
    var relateID : String?
    var catg : FlowCatg = FlowCatg.None
    /// 展示展开按钮
    var showMore : Bool = false
    /// 展示流程信息，默认为true
    var showProgress : Bool = true
    /// 头部样式，默认为不显示
    var headerType : ShowHeaderButtonType = ShowHeaderButtonType.Phone
    /// 配合showMore使用，为True时有效，折叠数据显示的数量
    private var showCount : Int = 5
    private var isShowData : Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        self.tableView?.addObserver(self, forKeyPath: "contentSize", options: [.new, .old], context: nil)
    }
    
    deinit {
        self.tableView?.removeObserver(self, forKeyPath: "contentSize")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.showMore && self.contentArray.count > self.showCount {
            return self.isShowData ? self.contentArray.count : self.showCount
        }
        return self.contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "TitleArrowCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TitleArrowCell
        if cell == nil {
            cell = TitleArrowCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        if self.contentArray.count > 0 {
            cell?.model = self.contentArray.object(at: indexPath.row) as? PubNormalModel
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.showMore ? 50 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
         let view = UIView.init()
        if !self.showMore {
            return view
        }
        
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.Color_Background_White()
        btn.setImage(UIImage.init(named: "icon_customer_search"), for: UIControlState.normal)
        btn.setImage(UIImage.init(named: "filter_dismiss"), for: UIControlState.selected)
        btn.isSelected = self.isShowData
        btn.addTarget(self, action: #selector(showOrHidden(_:)), for: UIControlEvents.touchUpInside)
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.contentArray.object(at: indexPath.row) as! PubNormalModel
        switch model.dataType {
        case .Contact:
            FlowHelper().toContactDetailByStaffID(model.showContent!)
        case .TextDetail:
            FlowHelper().toContentDetailText(model.showContent!)
        default:
            break
        }
        
    }
    
    @objc private func showOrHidden(_ sender : UIButton) -> Void {
        sender.isSelected = !sender.isSelected
        self.isShowData = sender.isSelected
        self.tableView?.reloadData()
    }
    
    /// 添加流程信息的控制器
    func addProgressVC() -> Void {
        if self.progressVC == nil && self.showProgress {
            let vc = ProgressViewController()
            vc.relateID = self.relateID
            vc.catg = self.catg
            self.addChildViewController(vc)
            self.scrollView.addSubview(vc.view)
            self.scrollView.width = UIScreen.main.bounds.size.width
            self.progressVC = vc
            vc.view.top = (self.tableView?.bottom)!
            
            vc.didMove(toParentViewController: self)
            vc.updateHeightBlock = { h in
                self.progressTableViewContentHeight = h
                self.updateScrollViewContentSize()
            }
        }
    }
    
    /// 设置scrollView的滚动范围
    private func updateScrollViewContentSize() -> Void {
        self.scrollView.contentSize = CGSize(width: self.scrollView.width, height: self.tableViewContentHeight + self.progressTableViewContentHeight)
    }
    
    ///监听
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "contentSize" && (object as! UITableView) == self.tableView) {
            let size = change![.newKey] as! CGSize
            self.tableViewContentHeight = size.height
            self.tableView?.height = self.tableViewContentHeight
            self.progressVC?.view.top = (self.tableView?.bottom)!
            self.updateScrollViewContentSize()
        }
    }

    lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView.init(frame: self.view.bounds)
        self.view.addSubview(scrollView)
        return scrollView
    }()
    
    lazy var tableView : UITableView? = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        if self.headerType != .None {
            tableView.tableHeaderView = self.tableHeaderView
        }
        self.scrollView.addSubview(tableView)
        
        return tableView
    }()
    
    /// MARK:tableview的头部视图
    lazy var tableHeaderView : UIView = {
        let tableHeaderView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 77))
        tableHeaderView.backgroundColor = UIColor.Color_Text_Blue_0()
        return tableHeaderView
    }()
    
    lazy var nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont + 5))
        self.tableHeaderView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.tableHeaderView).offset(16)
            make.top.equalTo(self.tableHeaderView).offset(14)
            make.right.equalTo(self.rightButton.snp.left).offset(-10)
        })
        return nameLabel
    }()
    
    lazy var phoneLabel : UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.textColor = UIColor.white
        phoneLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 2))
        self.tableHeaderView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.nameLabel)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(6)
            make.right.equalTo(self.nameLabel)
        })
        return phoneLabel
    }()
    
    lazy var rightButton : UIButton = {
        let rightButton = UIButton.init(type: UIButtonType.custom)
        self.tableHeaderView.addSubview(rightButton)
        rightButton.snp.makeConstraints({ (make) in
            make.right.equalTo(self.tableHeaderView).offset(-16)
            make.top.equalTo(self.tableHeaderView)
            make.bottom.equalTo(self.tableHeaderView)
            make.width.equalTo(60)
        })
        
        let imageView : UIImageView = UIImageView.init(image: UIImage.init(named: "call"))
        if self.headerType == .Location {
            imageView.image = UIImage.init(named: "icon_im_cus")
        }
        rightButton.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.right.equalTo(rightButton)
            make.centerY.equalTo(rightButton)
        })
        
        return rightButton
    }()
}
