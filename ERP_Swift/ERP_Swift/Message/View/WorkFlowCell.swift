//
//  WorkFlowCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/20.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class WorkFlowCell: BasicCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var model : BasicModel? {
        get {
            return self.model
        }
        set(newModel) {
            self.titleLabel.text = newModel?.s1
            self.timeLabel.text = newModel?.s3
            self.stateLabel.text = newModel?.s2
        }
    }
    
    /// 标题
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont + 1))
        titleLabel.textColor = UIColor.Color_Text_Black_0()
        titleLabel.textAlignment = NSTextAlignment.left
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(16)
            make.height.greaterThanOrEqualTo(22)
            make.centerY.equalTo(self.contentView)
        })
        return titleLabel
    }()
    
    /// 时间
    lazy var timeLabel : UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 2))
        timeLabel.textColor = UIColor.Color_Text_Gray_0()
        timeLabel.textAlignment = NSTextAlignment.left
        self.contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints({ (make) in
            make.top.bottom.equalTo(self.titleLabel)
            make.right.equalTo(self.contentView).offset(-16).priority(.high)
        })
        return timeLabel
    }()
    
    /// 状态
    lazy var stateLabel : UILabel = {
        let stateLabel = UILabel()
        stateLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 2))
        stateLabel.textColor = UIColor.Color_Text_Gray_0()
        stateLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(stateLabel)
        stateLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.titleLabel.snp.right).offset(12).priority(.low)
            make.right.equalTo(self.timeLabel.snp.left).offset(-12)
            make.top.bottom.equalTo(self.titleLabel)
        })
        return stateLabel
    }()

}
