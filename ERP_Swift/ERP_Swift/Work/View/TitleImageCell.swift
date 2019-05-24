//
//  TitleImageCell.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/22.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

let kTitleImageCellIdentifier = "TitleImageCell"

enum TitleImageCellType : Int {
    case HeaderImage = 0
    case SelectedImage
}

class TitleImageCell: TitleArrowCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var titleImageCellType : TitleImageCellType = TitleImageCellType.HeaderImage
    
    
    override var model : PubNormalModel? {
        get {
            return self.model
        }
        set(newModel) {
            self.titleLabel.text = newModel?.title
            switch self.titleImageCellType {
            case .HeaderImage:
                self.rightImageView.kf.setImage(with: Tools().getOssUrlStrr((newModel?.desc)!), placeholder: UIImage.init(named: "def_header"), options: nil, progressBlock: nil, completionHandler: nil)
            case .SelectedImage:
                self.arrowImageView.snp.updateConstraints { (make) in
                    make.width.height.equalTo(0)
                }
                if newModel?.dataType == .Time_Select {
                    self.rightImageView.isHidden = true
                    self.describeLabel.text = newModel?.desc == nil ? newModel?.placeHolder : newModel?.desc
                } else {
                    self.describeLabel.text = nil
                    self.rightImageView.isHidden = false
                    self.rightImageView.contentMode = UIViewContentMode.scaleAspectFill
                    self.rightImageView.image = (newModel?.isSelected)! ? UIImage.init(named: "public_pic_preview_selected") : UIImage.init(named: "uncheck")
                    self.rightImageView.snp.updateConstraints({ (make) in
                        make.top.equalTo(self.contentView).offset(16)
                        make.bottom.equalTo(self.contentView).offset(-16)
                    })
                }
            }
        }
    }
    
    lazy var rightImageView : UIImageView = {
        let rightImageView = UIImageView.init()
        self.contentView.addSubview(rightImageView)
        rightImageView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.contentView).offset(10)
            make.bottom.equalTo(self.contentView).offset(-10)
            make.width.equalTo(rightImageView.snp.height)
            make.right.equalTo(self.arrowImageView.snp.left).offset(-8)
        })
        return rightImageView
    }()

}
