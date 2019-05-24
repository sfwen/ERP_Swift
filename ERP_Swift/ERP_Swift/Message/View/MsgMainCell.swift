//
//  MsgMainCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/19.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SnapKit

class MsgMainCell: BasicCell {
    
    /// icon
    lazy var iconImageView : UIImageView = {
        let iconImageView = UIImageView.init()
        iconImageView.cornerRadius = 23
        self.contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(16)
            make.width.height.equalTo(46)
        })
        
        let line = UIView.init()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        self.contentView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(65)
            make.right.equalTo(self.contentView)
            make.height.equalTo(0.5)
            make.bottom.equalTo(self.contentView)
        }
        
        return iconImageView
    }()
    
    /// 未读消息数量
    lazy var undoCounViewt : UIView = {
        let undoCounViewt = UIView()
        self.contentView.addSubview(undoCounViewt)
        undoCounViewt.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView)
            make.bottom.equalTo(self.iconImageView)
            make.top.equalTo(self.iconImageView).offset(4)
            make.right.equalTo(self.iconImageView).offset(-4)
        })
        return undoCounViewt
    }()
    
    /// 标题
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont + 1))
        titleLabel.textColor = UIColor.Color_Text_Black_0()
        titleLabel.textAlignment = NSTextAlignment.left
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView.snp.right).offset(10);
            make.top.equalTo(self.iconImageView);
            make.right.equalTo(self.contentView).offset(-10);
        })
        return titleLabel
    }()
    
    /// 描述
    lazy var describeLabel : UILabel = {
        let describeLabel = UILabel()
        describeLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 1))
        describeLabel.textColor = UIColor.Color_Text_Gray_0()
        describeLabel.textAlignment = NSTextAlignment.left
        self.contentView.addSubview(describeLabel)
        describeLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.titleLabel);
            make.bottom.equalTo(self.iconImageView);
            make.right.equalTo(self.titleLabel);
        })
        return describeLabel
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.left
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var model : MainMessageModel? {
        get {
            return self.model
        }
        set(newModel) {
            self.iconImageView.image = UIImage.init(named: (newModel?.icon)!)
            self.titleLabel.text = newModel?.title
            self.describeLabel.text = newModel?.describe
        }
    }
    

}
