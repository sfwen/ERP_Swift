//
//  FiveLabelCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/3.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class FiveLabelCell: FourLabelCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override var model : BasicModel? {
        get {
            return self.model
        }
        set(newModel) {
            self.label0_0?.text = newModel?.s1
            self.label0_1?.text = newModel?.s2
            self.label1_0?.text = newModel?.s3
            self.label1_1?.text = newModel?.s4
            self.label2_0?.text = newModel?.s5
        }
    }
    
    /// 第三排第一个
    lazy var label2_0 : UILabel? = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 1))
        lab.textColor = UIColor.Color_Text_Black_1()
        self.contentView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.right.equalTo(self.contentView).offset(-8)
            make.left.equalTo(self.label1_0!)
            make.top.equalTo((self.label1_0?.snp.bottom)!).offset(12)
//            make.height.equalTo(22)
        })
        return lab
    }()

}
