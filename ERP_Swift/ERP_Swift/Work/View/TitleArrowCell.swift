//
//  TitleArrowCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/8.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

let kTitleArrowCellIdentifier = "TitleArrowCell"

class TitleArrowCell: BasicCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var model : PubNormalModel? {
        get {
            return self.model
        }
        set(newModel) {
            self.titleLabel.text = newModel?.title
            self.describeLabel.text = newModel?.desc
            let w = (newModel?.showArrow)! ? 21 : 0
            self.arrowImageView.snp.updateConstraints { (make) in
                make.width.height.equalTo(w)
            }
        }
    }
    
    lazy var titleLabel : UILabel = {
        let lab = UILabel.init()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont))
        lab.textColor = UIColor.Color_Text_Black_0()
        self.contentView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(16)
            make.centerY.equalTo(self.contentView)
            make.width.greaterThanOrEqualTo(80)
        })
        self.bottomLineView.isHidden = false
        return lab
    }()
    
    lazy var bottomLineView : UIView = {
        let line = UIView.init()
        line.backgroundColor = UIColor.borderLineColor_0();
        self.contentView.addSubview(line)
        line.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView).offset(16)
            make.bottom.equalTo(self.contentView)
            make.right.equalTo(self.contentView)
            make.height.equalTo(0.5)
        })
        return line
    }()
    
    lazy var arrowImageView : UIImageView = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "contents_arrow")
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.right.equalTo(self.contentView).offset(-8)
            make.centerY.equalTo(self.contentView)
            make.width.height.equalTo(21)
        })
        return imageView
    }()
    
    lazy var describeLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 1))
        lab.textColor = UIColor.Color_Text_Gray_0()
        lab.numberOfLines = 0
        lab.adjustsFontSizeToFitWidth = true
        lab.textAlignment = NSTextAlignment.right
        self.contentView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.titleLabel)
            make.right.equalTo(self.arrowImageView.snp.left).offset(-8)
            make.left.equalTo(self.titleLabel.snp.right).offset(8)
        })
        self.bottomLineView.isHidden = false
        return lab
    }()

}
