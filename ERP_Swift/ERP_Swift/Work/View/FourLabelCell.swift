//
//  FourLabelCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/23.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class FourLabelCell: BasicCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let line = UIView.init()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        self.contentView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(16)
            make.right.equalTo(self.contentView)
            make.height.equalTo(0.5)
            make.bottom.equalTo(self.contentView)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            self.label0_0?.text = newModel?.s1
            self.label0_1?.text = newModel?.s2
            self.label1_0?.text = newModel?.s3
            self.label1_1?.text = newModel?.s4
        }
    }
    
    /// 第一排第二个
    lazy var label0_1 : UILabel? = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 1))
        lab.textColor = UIColor.Color_Text_Black_1()
        self.contentView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.right.equalTo(self.contentView).offset(-8)
            make.width.greaterThanOrEqualTo(1)
//            make.width.lessThanOrEqualTo(self.contentView.width / 2.0)
            make.top.equalTo(self.contentView).offset(12)
            make.height.equalTo(22)
        })
        return lab
    }()
    
    /// 第一排第一个
    lazy var label0_0 : UILabel? = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont + 1))
        lab.textColor = UIColor.Color_Text_Black_0()
        self.contentView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(8)
            make.top.equalTo(self.contentView).offset(12)
            make.height.equalTo(22)
            make.right.equalTo(self.contentView).offset(-8)
        })
        return lab
    }()
    
    /// 第二排第二个
    lazy var label1_1 : UILabel? = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 1))
        lab.textColor = UIColor.Color_Text_Black_1()
        self.contentView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.right.equalTo(self.contentView).offset(-8)
            make.width.greaterThanOrEqualTo(1)
//            make.width.lessThanOrEqualTo(160)
            make.top.equalTo((self.label0_0?.snp.bottom)!).offset(12)
            make.height.equalTo(20)
        })
        return lab
    }()
    
    /// 第二排第一个
    lazy var label1_0 : UILabel? = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 1))
        lab.textColor = UIColor.Color_Text_Black_0()
        self.contentView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.left.equalTo(self.label0_0!)
            make.top.equalTo((self.label0_0?.snp.bottom)!).offset(12)
            make.height.equalTo(20)
//            make.right.equalTo(self.contentView).offset(-8)
            make.right.lessThanOrEqualTo((self.label1_1?.snp.left)!).offset(-8)
        })
        return lab
    }()
    
}
