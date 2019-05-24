//
//  MeHeaderCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/26.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import Kingfisher

class MeHeaderCell: BasicCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData() -> Void {
        self.headerImageView.kf.setImage(with: nil, placeholder: UIImage.init(named: "def_header"), options: nil, progressBlock: nil, completionHandler: nil)
        self.titleLabel.text = currUserInfo.User.name
        self.arrowImageView?.isHidden = false
    }
    
    /// header
    lazy var headerImageView : UIImageView = {
        let iconImageView = UIImageView.init()
        iconImageView.cornerRadius = 32
        self.contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(16)
            make.width.height.equalTo(64)
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
            make.left.equalTo(self.contentView)
            make.right.equalTo(self.contentView)
            make.height.equalTo(0.5)
            make.bottom.equalTo(self.contentView)
        }
        
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
            make.left.equalTo(self.headerImageView.snp.right).offset(10)
            make.bottom.equalTo(self.contentView.snp.centerY).offset(-1)
            make.right.equalTo(self.contentView).offset(-50)
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
            make.top.equalTo(self.contentView.snp.centerY).offset(4)
            make.right.equalTo(self.titleLabel);
        })
        return describeLabel
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
