//
//  LeftRightCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/29.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class LeftRightCell: BasicCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var model : NSDictionary? {
        get {
            return self.model
        }
        set(newModel) {
            self.iconImageView.image = UIImage.init(named: (newModel!["image"] as! String))
            self.titleLabel.text = (newModel?["title"] as! String)
        }
    }
    
    /// icon
    lazy var iconImageView : UIImageView = {
        let iconImageView = UIImageView.init()
        self.contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(16)
            make.width.height.equalTo(30)
        })
        
//        let line = UIView.init()
//        if #available(iOS 11.0, *) {
//            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
//        } else {
//            // Fallback on earlier versions
//            line.backgroundColor = UIColor.borderLineColor_0()
//        }
//        self.contentView.addSubview(line)
//        line.snp.makeConstraints { (make) in
//            make.left.equalTo(self.contentView).offset(65)
//            make.right.equalTo(self.contentView)
//            make.height.equalTo(0.5)
//            make.bottom.equalTo(self.contentView)
//        }
        
        return iconImageView
    }()
    
    /// 标题
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont + 1))
        titleLabel.textColor = UIColor.Color_Text_Black_0()
        titleLabel.textAlignment = NSTextAlignment.left
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView.snp.right).offset(10)
            make.centerY.equalTo(self.contentView.snp.centerY).offset(-1)
//            make.right.equalTo((self.arrowImageView?.snp.left)!).offset(-10)
            make.right.equalTo(self.contentView).offset(-50)
        })
        self.arrowImageView?.isHidden = false
        return titleLabel
    }()
    
    lazy var arrowImageView : UIImageView? = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "contents_arrow")
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.right.equalTo(self.contentView).offset(-16)
            make.centerY.equalTo(self.contentView)
        })
        return imageView
    }()
}
