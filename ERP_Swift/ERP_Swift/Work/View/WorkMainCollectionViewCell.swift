//
//  WorkMainCollectionViewCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/20.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class WorkMainCollectionViewCell: UICollectionViewCell {
    lazy var iconImageView : UIImageView = {
        let iconImageView = UIImageView()
        self.contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.contentView)
            make.centerY.equalTo(self.contentView).offset(-30)
            make.width.height.equalTo(54)
        })
        return iconImageView
    }()
    
    lazy var titleLabel : UILabel = {
       let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont))
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = UIColor.Color_Text_Black_0()
        titleLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(8)
            make.right.equalTo(self.contentView).offset(-8)
            make.top.equalTo(self.iconImageView.snp.bottom).offset(8)
        })
        return titleLabel
    }()
    
    var model : OptionModel? {
        get {
            return self.model
        }
        set(newValue) {
            self.iconImageView.image = UIImage(named: (newValue?.imageName)!)
            self.titleLabel.text = newValue?.name
        }
    }
}
