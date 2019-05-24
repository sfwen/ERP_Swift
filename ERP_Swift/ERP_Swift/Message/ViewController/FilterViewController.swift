//
//  FilterViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/22.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    ///选中的对象
    var selectedModel : PubNormalModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.clear
        self.reloadData()
    }
    
    func reloadData() -> Void {
        self.leftTableView.reloadData()
        self.rightTableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = ((touches as NSSet).anyObject() as AnyObject)
        if touch.view == self.view {
            self.sendToBackAndHidden()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.leftTableView {
            return self.contentArray.count
        } else if tableView == self.rightTableView {
            return (self.selectedModel?.contentArray.count)!
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.leftTableView {
            let identifier = "Cell"
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? BasicCell
            if cell == nil {
                cell = BasicCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            }
            
            let model = self.contentArray.object(at: indexPath.row) as? PubNormalModel
            cell?.textLabel?.text = model?.title
            cell?.backgroundColor = (model?.isSelected)! ? UIColor.white : UIColor.clear
            
            return cell!
        } else if tableView == self.rightTableView {
            var cell = tableView.dequeueReusableCell(withIdentifier: kTitleImageCellIdentifier) as? TitleImageCell
            if cell == nil {
                cell = TitleImageCell(style: UITableViewCellStyle.default, reuseIdentifier: kTitleImageCellIdentifier)
            }
            cell?.titleImageCellType = TitleImageCellType.SelectedImage
            let model = self.selectedModel?.contentArray.object(at: indexPath.row) as! PubNormalModel
            cell?.model = model
            return cell!
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.leftTableView {
            for (index, value) in self.contentArray.enumerated() {
                let model = value as! PubNormalModel
                
                if indexPath.row == index {
                    model.isSelected = true
                    self.selectedModel = model
                } else {
                    model.isSelected = false
                }
            }
        } else if tableView == self.rightTableView {
            let model = self.selectedModel!
            if model.dataType == .Time_Select {
                let subModel = model.contentArray.object(at: indexPath.row) as! PubNormalModel
                self.showDatePickerView(subModel)
            } else {
                if model.isMultiSelected {
                    for (_, value) in model.contentArray.enumerated() {
                        let subModel = value as! PubNormalModel
                        if subModel.value != -1 {
                            subModel.isSelected = !subModel.isSelected
                        }
                    }
                    self.updateContentArrayUnlimitedState(model)
                } else {
                    for (index, value) in model.contentArray.enumerated() {
                        let subModel = value as! PubNormalModel
                        if index == indexPath.row {
                            subModel.isSelected = true
                        } else {
                            subModel.isSelected = false
                        }
                    }
                }
            }
        }
        
        self.reloadData()
    }
    
    /// 更新数据状态
    func updateContentArrayUnlimitedState(_ model : PubNormalModel) -> Void {
        var unlimitedState = true
        
        for (_, value) in model.contentArray.enumerated() {
            let subModel = value as! PubNormalModel
            if subModel.value == -1 {
                continue
            }
            
            if (subModel.dataType == .Time_Select && !(subModel.desc?.isEmpty)!) || subModel.isSelected {
                unlimitedState = false
                break
            }
        }
        let obj = model.contentArray.object(at: 0) as! PubNormalModel
        obj.isSelected = unlimitedState
    }
    
    /// 展示时间选择器
    func showDatePickerView(_ model : PubNormalModel) -> Void {
        let datePickerView = QCalendarPicker.init(selectedDate: { (date : String) in
            print(date)
            model.desc = date
            self.rightTableView.reloadData()
        })
        datePickerView.isAllowSelectTime = false
        
        datePickerView.show()
    }
    
    func sendToBackAndHidden() -> Void {
        self.willMove(toParentViewController: nil)
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
    }
    
    func sendToFrontAndShow(_ selectedData : NSArray, con : UIViewController) -> Void {
        con.addChildViewController(self)
        con.view.addSubview(self.view)
        self.didMove(toParentViewController: con)
        self.reloadData()
    }
    
    lazy var bottomView : UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.Color_Background_Gray_2()
        self.view.addSubview(view)
        view.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.view.centerY)
            make.height.equalTo(55)
        })
        
        let resetButton = UIButton.init(type: UIButtonType.custom)
        resetButton.setTitle("重置", for: UIControlState.normal)
        resetButton.setTitleColor(UIColor.Color_Text_Gray_0(), for: UIControlState.normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 2))
        view.addSubview(resetButton)
        resetButton.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(view)
            make.width.equalTo(100)
        })
        
        let sureButton = UIButton.init(type: UIButtonType.custom)
        sureButton.setTitle("确定", for: UIControlState.normal)
        sureButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        sureButton.setBackgroundImage(UIImage.init(named: "bg_green"), for: UIControlState.normal)
        sureButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 2))
        view.addSubview(sureButton)
        sureButton.snp.makeConstraints({ (make) in
            make.right.equalTo(view).offset(-16)
            make.width.equalTo(74)
            make.height.equalTo(34)
            make.centerY.equalTo(view)
        })
        
        return view
    }()

    lazy var leftTableView : UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.Color_Background_Gray_2()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.view)
            make.bottom.equalTo(self.bottomView.snp.top)
            make.width.equalTo(self.view).multipliedBy(0.25)
        })
        
        let line = UIView.init()
        line.backgroundColor = UIColor.borderLineColor_0();
        tableView.addSubview(line)
        line.snp.makeConstraints({ (make) in
            make.top.equalTo(tableView)
            make.bottom.equalTo(tableView)
            make.right.equalTo(tableView)
            make.width.equalTo(0.5)
        })
        
        return tableView
    }()

    lazy var rightTableView : UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.view)
            make.left.equalTo(self.leftTableView.snp.right)
            make.bottom.equalTo(self.bottomView.snp.top)
            make.right.equalTo(self.view)
        })
        return tableView
    }()
    
    lazy var contentArray : NSMutableArray = {
        let contentArray = NSMutableArray.init()
        
        let categoryData = NSMutableArray.init()
        var model = PubNormalModel.init()
        model.title = "流程类别"
        model.isSelected = true
        
        var subModel = PubNormalModel.init()
        subModel.title = "不限"
        subModel.value = -1
        subModel.isSelected = true
        model.contentArray.add(subModel)
        for i in 1...300 {
            var catg : FlowCatg? = FlowCatg(rawValue: i)
            if catg != nil {
                let name = flowCatgToStr(catg!)
                if !name.isEmpty {
                    subModel = PubNormalModel.init()
                    subModel.title = name
                    subModel.value = i
                    model.contentArray.add(subModel)
                }
            }
        }
        self.selectedModel = model
        contentArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "流程状态"
        subModel = PubNormalModel.init()
        subModel.title = "不限"
        subModel.value = -1
        subModel.isSelected = true
        model.contentArray.add(subModel)
        for i in 1...5 {
            let name = flowStateToStr(FlowStateType(rawValue: i)!)
            if !name.isEmpty {
                subModel = PubNormalModel.init()
                subModel.title = name
                subModel.value = i
                model.contentArray.add(subModel)
            }
        }
        contentArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "紧急程度"
        subModel = PubNormalModel.init()
        subModel.title = "不限"
        subModel.value = -1
        subModel.isSelected = true
        model.contentArray.add(subModel)
        for i in 1...3 {
            let name = flowUrgencyToStr(FlowUrgency(rawValue: i)!)
            if !name.isEmpty {
                subModel = PubNormalModel.init()
                subModel.title = name
                subModel.value = i
                model.contentArray.add(subModel)
            }
        }
        contentArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "是否抄送"
        subModel = PubNormalModel.init()
        subModel.title = "不限"
        subModel.value = -1
        subModel.isSelected = true
        model.contentArray.add(subModel)
        for (i, value) in [NSNumber.init(value: true), NSNumber.init(value: false)].enumerated() {
            let name = BoolToStr(value as! Bool)
            subModel = PubNormalModel.init()
            subModel.title = name
            subModel.value = i
            model.contentArray.add(subModel)
        }
        contentArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "传递日期"
        model.dataType = .Time_Select
        
        subModel = PubNormalModel.init()
        subModel.title = "不限"
        subModel.value = -1
        subModel.isSelected = true
        model.contentArray.add(subModel)
        
        subModel = PubNormalModel.init()
        subModel.title = "起始日期"
        subModel.placeHolder = "请选择"
        subModel.dataType = .Time_Select
        model.contentArray.add(subModel)
        
        subModel = PubNormalModel.init()
        subModel.title = "截止日期"
        subModel.placeHolder = "请选择"
        subModel.dataType = .Time_Select
        model.contentArray.add(subModel)
        
        contentArray.add(model)
        
        return contentArray
    }()
}
