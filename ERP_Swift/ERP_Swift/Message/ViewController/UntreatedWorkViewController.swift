//
//  UntreatedWorkViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/20.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class UntreatedWorkViewController: UIViewController {
    
    private var vcs = [UIViewController & SliderViewContainerDelegate]()
    private var titles = [String]()
    private let slideMenu = SliderView.init(frame: CGRect.zero, indicatorType: .stretch, titles: [], childControllers: [])
    
    var myWorkFilterCtrl : FilterViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "未处理任务"
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        self.view.backgroundColor = UIColor.white
        
        self.slideMenu.tabBarWidth = self.view.width
//        self.slideMenu.tabBarHeight = 50

//        self.slideMenu.indicatorWidth = 73.0
        
        let myVC = WorkListViewController()
        myVC.isHiddenListHeaderView = true
        myVC.workListCtrlType = .MyUndo
        
        let allVC = WorkListViewController()
        allVC.isHiddenListHeaderView = true
        allVC.workListCtrlType = .AllUndo
        
        self.vcs = [myVC, allVC]
        self.titles = ["我的任务", "全部任务"]
        
        self.slideMenu.reloadView(titles: self.titles, controllers: self.vcs)
        self.view.addSubview(self.slideMenu)
        self.automaticallyAdjustsScrollViewInsets = false
        self.slideMenu.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self.view)
            make.top.equalTo(self.view)
        }
        
        let rightBarButtonItem = UIBarButtonItem.init(title: "筛选", style: UIBarButtonItemStyle.plain, target: self, action: #selector(showFilter))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.Color_Text_Orange()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func showFilter() -> Void {
        if self.myWorkFilterCtrl == nil {
            let vc = FilterViewController()
            self.myWorkFilterCtrl = vc
            vc.sendToFrontAndShow([], con: self)
        } else {
            self.myWorkFilterCtrl?.sendToFrontAndShow([], con: self)
        }
        
    }

}
