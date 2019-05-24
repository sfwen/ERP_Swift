//
//  ProgressDetailCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/6.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
//import ImageView+Kingfisher

class ProgressDetailCell: BasicCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.Color_Background_Gray_2()
        self.descContentBackgroundView.isHidden = false
        self.nodeNameLabel.text = "工程部"
        self.rightItem1.isHidden = false
        self.nameLabel.text = "名字"
        self.descLabel.text = "带的动"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model : FlowLogModel? {
        get {
            return self.model
        }
        set(newModel) {
            self.headerImageView.kf.setImage(with: Tools().getOssUrlStrr((newModel?.operHeadPath)!), placeholder: UIImage.init(named: "def_header"), options: nil, progressBlock: nil, completionHandler: nil)
            self.nodeNameLabel.text = newModel?.nodeName
            self.nameLabel.text = newModel?.oper
            self.createTimeLabel.text = "传递时间：" + ((newModel?.creTime)?.substring(toIndex: 16))!
            self.handleTimeLabel.text = "处理时间：" + ((newModel?.handleTime)?.substring(toIndex: 16))!
            self.descLabel.text = newModel?.handleDesc
            
            let logState = FlowNodeLogState(rawValue: (newModel?.state)!)
            
            switch logState {
            case .Started?, .Adopted?, .AlreadyView?, .Delegated?:
                self.nameLabel.textColor = UIColor.Color_Text_Black_0()
                self.iconImageView.image = UIImage.init(named: "workflow_agree_icon")
            case .WaitHandle? :
                self.nameLabel.textColor = UIColor.Color_Text_Orange()
                self.iconImageView.image = UIImage.init(named: "workflow_current_icon")
            default:
                self.nameLabel.textColor = UIColor.Color_Text_Black_0()
                self.iconImageView.image = UIImage.init(named: "workflow_refuse_icon")
            }
        }
    }
    
    /// header
    lazy var headerImageView : UIImageView = {
        let headerImageView = UIImageView.init()
        headerImageView.cornerRadius = 32
        headerImageView.image = UIImage.init(named: "def_header")
        self.contentView.addSubview(headerImageView)
        headerImageView.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self.contentView).offset(16)
            make.left.equalTo(self.contentView).offset(16)
            make.width.height.equalTo(64)
        })
        
        var line = UIView.init()
        line.backgroundColor = UIColor.Color_Background_Gray_1()
        self.contentView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.centerX.equalTo(headerImageView)
            make.top.equalTo(self.contentView)
            make.bottom.equalTo(headerImageView.snp.top).offset(-4)
            make.width.equalTo(2)
        }
        
        line = UIView.init()
        line.backgroundColor = UIColor.Color_Background_Gray_1()
        self.contentView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.centerX.equalTo(headerImageView)
            make.bottom.equalTo(self.contentView)
            make.top.equalTo(headerImageView.snp.bottom).offset(4)
            make.width.equalTo(2)
        }
        
        return headerImageView
    }()
    
    lazy var descContentBackgroundView : UIView = {
        let descContentBackgroundView = UIView.init()
        self.contentView.addSubview(descContentBackgroundView)
        descContentBackgroundView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.headerImageView.snp.right).offset(12)
            make.top.equalTo(self.contentView).offset(44)
            make.right.equalTo(self.contentView.snp.right).offset(-30)
            make.bottom.equalTo(self.contentView).offset(-20)
        })
        
        let topImageView : UIImageView = UIImageView.init()
        topImageView.image = UIImage.init(named: "im_chat_other_chat_pop_up")
        descContentBackgroundView.addSubview(topImageView)
        topImageView.snp.makeConstraints({ (make) in
            make.left.top.right.equalTo(descContentBackgroundView)
            make.height.equalTo(descContentBackgroundView).multipliedBy(0.5)
        })
        
        let downImageView : UIImageView = UIImageView.init()
        downImageView.image = UIImage.init(named: "im_chat_other_chat_pop_down")
        descContentBackgroundView.addSubview(downImageView)
        downImageView.snp.makeConstraints({ (make) in
            make.left.bottom.right.equalTo(descContentBackgroundView)
            make.top.equalTo(topImageView.snp.bottom)
        })
        
        descContentBackgroundView.layer.shadowColor = UIColor.RGBColor(red: 100, green: 100, blue: 100).cgColor
        descContentBackgroundView.layer.shadowOffset = CGSize(width: 1, height: 1)
        descContentBackgroundView.layer.shadowOpacity = 0.5
        descContentBackgroundView.layer.shadowRadius = 2
        
        return descContentBackgroundView
    }()
    
    lazy var nodeNameLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 2))
        lab.textColor = UIColor.Color_Text_Black_2()
        self.contentView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.left.equalTo(self.descContentBackgroundView).offset(8)
            make.bottom.equalTo(self.descContentBackgroundView.snp.top).offset(-4)
        })
        return lab
    }()
    
    lazy var rightItem0 : UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.white
        btn.cornerRadius = 4
        btn.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 5))
        btn.setTitle("紧急", for: UIControlState.normal)
        btn.setTitleColor(UIColor.Color_Text_Orange(), for: UIControlState.normal)
        self.contentView.addSubview(btn)
        btn.snp.makeConstraints({ (make) in
            make.right.equalTo(self.descContentBackgroundView)
            make.bottom.equalTo(self.descContentBackgroundView.snp.top).offset(-6)
            make.width.equalTo(37)
            make.height.equalTo(19)
        })
        return btn
    }()
    
    lazy var rightItem1 : UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.backgroundColor = UIColor.white
        btn.cornerRadius = 4
        btn.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 5))
        btn.setTitle("抄送", for: UIControlState.normal)
        btn.setTitleColor(UIColor.Color_Text_Orange(), for: UIControlState.normal)
        self.contentView.addSubview(btn)
        btn.snp.makeConstraints({ (make) in
            make.right.equalTo(self.rightItem0.snp.left).offset(-4)
            make.bottom.equalTo(self.rightItem0)
            make.width.equalTo(self.rightItem0)
            make.top.equalTo(self.rightItem0)
        })
        return btn
    }()
    
    lazy var iconImageView : UIImageView = {
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "workflow_current_icon")
        self.descContentBackgroundView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.descContentBackgroundView).offset(20)
            make.top.equalTo(self.descContentBackgroundView).offset(12)
            make.width.height.equalTo(18)
        })
        return imageView
    }()
    
    lazy var nameLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont + 2))
        lab.textColor = UIColor.Color_Text_Orange()
        self.descContentBackgroundView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.left.equalTo(self.iconImageView.snp.right).offset(6)
            make.centerY.equalTo(self.iconImageView)
            make.height.greaterThanOrEqualTo(23)
        })
        return lab
    }()
    
    lazy var stateLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont))
        lab.textColor = UIColor.Color_Text_Black_2()
        self.descContentBackgroundView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.right.equalTo(self.descContentBackgroundView).offset(-12)
            make.centerY.equalTo(self.nameLabel)
        })
        return lab
    }()
    
    /// 处理时间
    lazy var handleTimeLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 3))
        lab.textColor = UIColor.Color_Text_Black_2()
        lab.text = "处理时间：2018-11-08 10：30"
        self.descContentBackgroundView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.right.equalTo(self.descContentBackgroundView).offset(-12)
            make.bottom.equalTo(self.descContentBackgroundView).offset(-8)
        })
        return lab
    }()
    
    /// 传递时间
    lazy var createTimeLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 3))
        lab.textColor = UIColor.Color_Text_Black_2()
        lab.text = "传递时间：2018-11-08 10：30"
        self.descContentBackgroundView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.right.equalTo(self.descContentBackgroundView).offset(-12)
            make.bottom.equalTo(self.handleTimeLabel.snp.top).offset(-4)
        })
        return lab
    }()
    
    lazy var descLabel : UILabel = {
        let lab = UILabel()
        lab.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont))
        lab.numberOfLines = 0
        lab.textColor = UIColor.Color_Text_Black_2()
        self.descContentBackgroundView.addSubview(lab)
        lab.snp.makeConstraints({ (make) in
            make.right.equalTo(self.descContentBackgroundView).offset(-12)
            make.bottom.equalTo(self.createTimeLabel.snp.top).offset(-8)
            make.left.equalTo(self.iconImageView)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(12)
        })
        return lab
    }()

}
