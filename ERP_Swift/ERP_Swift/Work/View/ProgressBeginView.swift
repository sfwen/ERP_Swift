//
//  ProgressBeginView.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/6.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class ProgressBeginView: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.initDefatultView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefatultView() -> Void {
        self.contentView.backgroundColor = UIColor.Color_Background_Gray_2()
        let iconView : UIView = UIView.init()
        iconView.backgroundColor = UIColor.Color_Background_Gray()
        iconView.cornerRadius = 6
        self.contentView.addSubview(iconView)
        iconView.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(42)
            make.top.equalTo(self.contentView).offset(20)
            make.width.height.equalTo(12)
        }
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont))
        label.textColor = UIColor.lightGray
        label.text = "流程开始"
        self.contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.equalTo(iconView.snp.right).offset(12)
            make.centerY.equalTo(iconView)
        }
        
        let line = UIView.init()
        line.backgroundColor = UIColor.Color_Background_Gray_1()
        self.contentView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.centerX.equalTo(iconView)
            make.top.equalTo(iconView.snp.bottom).offset(4)
            make.bottom.equalTo(self.contentView)
            make.width.equalTo(2)
        }
    }
}
