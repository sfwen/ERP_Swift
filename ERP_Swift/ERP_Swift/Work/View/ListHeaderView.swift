//
//  ListHeaderView.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/24.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import Device

class ListHeaderView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        self.leftButton.isHidden = false
        self.rightButton.isHidden = false
        
        let line = UIView()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(0.5)
        }
    }
    
    lazy var middleLine : UIView? = {
        let line = UIView()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.height.equalTo(30)
            make.width.equalTo(0.5)
        }
        return line
    }()
    
    lazy var leftButton : UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setTitle("搜索", for: UIControlState.normal)
        btn.setTitleColor(UIColor.Color_Text_Black_1(), for: UIControlState.normal)
        btn.setImage(UIImage.init(named: "search"), for: UIControlState.normal)
        btn.layoutButtonImageEdgeInsetsStyle(style: ButtonImageEdgeInsetsStyle.left, space: 4)
        self.addSubview(btn)
        btn.snp.makeConstraints({ (make) in
            make.left.top.bottom.equalTo(self)
            make.right.equalTo((self.middleLine?.snp.left)!)
        })
        return btn
    }()
    
    lazy var rightButton : UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setTitle("状态", for: UIControlState.normal)
        btn.setTitleColor(UIColor.Color_Text_Black_1(), for: UIControlState.normal)
        btn.setImage(UIImage.init(named: "arrow_shrink"), for: UIControlState.normal)
        btn.layoutButtonImageEdgeInsetsStyle(style: ButtonImageEdgeInsetsStyle.right, space: -18)
        self.addSubview(btn)
        btn.snp.makeConstraints({ (make) in
            make.right.top.bottom.equalTo(self)
            make.left.equalTo((self.middleLine?.snp.right)!)
        })
        return btn
    }()
}
