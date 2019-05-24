//
//  ContactDetailViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/12.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var staffID : String = ""
    
    private var collectionButton : UIButton?
    private var contactModel : ContactModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        self.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() -> Void {
        if self.staffID.isEmpty {
            self.navigationController?.popViewController(animated: true)
            return
        }
        NetworkHelper.makePostRequest(baseUrl: AddrBookSelectDetail_API, parameters: ["staffID" : self.staffID as NSObject], needRequestHeader: false, successHandler: { (resp) in
            print(resp)
            self.contactModel = ContactModel.init(json: resp["AddrBook"])
            self.title = self.contactModel?.name
            
            self.headerImageView.kf.setImage(with: Tools().getOssUrlStrr((self.contactModel?.headPath)!), placeholder: UIImage.init(named: "def_header"), options: nil, progressBlock: nil, completionHandler: nil)
            self.nameLabel.text = self.contactModel?.name
            self.positionLabel.text = self.contactModel?.posName
            
            self.toolView.isHidden = false
            self.collectionButton?.isSelected = (self.contactModel?.isCollection)!
        }, errorMsgHandler: { (error) in
            self.navigationController?.popViewController(animated: true)
        }) { (error) in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func collectionContactAction(_ sender : UIButton) -> Void {
        var url = ""
        if sender.isSelected {
            url = AddrBookCancelCollection_API
        } else {
            url = AddrBookAddCollection_API
        }
        
        NetworkHelper.makePostRequest(baseUrl: url, parameters: ["staffID" : self.staffID as NSObject], needRequestHeader: false, successHandler: { (resp) in
            sender.isSelected = !sender.isSelected
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    

    lazy var headerImageView : UIImageView = {
        let headerImageView = UIImageView.init()
        headerImageView.cornerRadius = 50
        self.view.addSubview(headerImageView)
        headerImageView.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(20)
            make.width.height.equalTo(100)
        })
        
        return headerImageView
    }()
    
    lazy var nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont + 2))
        nameLabel.textColor = UIColor.Color_Text_Black_0()
        nameLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints({ (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.headerImageView.snp.bottom).offset(12)
        })
        return nameLabel
    }()
    
    lazy var positionLabel : UILabel = {
        let positionLabel = UILabel()
        positionLabel.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont - 2))
        positionLabel.textColor = UIColor.Color_Text_Gray_1()
        positionLabel.textAlignment = NSTextAlignment.center
        positionLabel.numberOfLines = 0
        self.view.addSubview(positionLabel)
        positionLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(6)
            make.left.equalTo(self.view).offset(34)
            make.right.equalTo(self.view).offset(-34)
        })
        return positionLabel
    }()
    
    lazy var toolView : UIView = {
        let toolView = UIView.init()
        self.view.addSubview(toolView)
        toolView.snp.makeConstraints({ (make) in
            make.left.right.equalTo(self.view)
            make.top.equalTo(self.positionLabel.snp.bottom).offset(6)
            make.height.equalTo(44)
        })
        
        let phoneButton = UIButton.init(type: UIButtonType.custom)
        phoneButton.backgroundColor = UIColor.clear
        phoneButton.setImage(UIImage.init(named: "edit_call"), for: UIControlState.normal)
        toolView.addSubview(phoneButton)
        phoneButton.snp.makeConstraints({ (make) in
            make.width.equalTo(toolView).dividedBy(3)
            make.top.left.bottom.equalTo(toolView)
        })
        
        var line = UIView.init()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        toolView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(phoneButton.snp.right).offset(-0.5)
            make.width.equalTo(1)
            make.bottom.equalTo(toolView).offset(-12)
            make.top.equalTo(toolView).offset(12)
        }

        let messageButton = UIButton.init(type: UIButtonType.custom)
        messageButton.backgroundColor = UIColor.clear
        messageButton.setImage(UIImage.init(named: "sms"), for: UIControlState.normal)
        toolView.addSubview(messageButton)
        messageButton.snp.makeConstraints({ (make) in
            make.width.equalTo(phoneButton)
            make.top.bottom.equalTo(toolView)
            make.left.equalTo(phoneButton.snp.right)
        })
        
        line = UIView.init()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        toolView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(messageButton.snp.right).offset(-0.5)
            make.width.equalTo(1)
            make.bottom.equalTo(toolView).offset(-12)
            make.top.equalTo(toolView).offset(12)
        }
        
        let collectionButton = UIButton.init(type: UIButtonType.custom)
        collectionButton.backgroundColor = UIColor.clear
        collectionButton.setImage(UIImage.init(named: "button_collect_user"), for: UIControlState.normal)
        collectionButton.setImage(UIImage.init(named: "button_collect_user_ok"), for: UIControlState.selected)
        collectionButton.addTarget(self, action: #selector(collectionContactAction(_:)), for: UIControlEvents.touchUpInside)
        toolView.addSubview(collectionButton)
        collectionButton.snp.makeConstraints({ (make) in
            make.width.equalTo(phoneButton)
            make.top.bottom.equalTo(toolView)
            make.left.equalTo(messageButton.snp.right)
        })
        self.collectionButton = collectionButton
        
        line = UIView.init()
        if #available(iOS 11.0, *) {
            line.backgroundColor = UIColor.init(named: "borderLineColor_0")
        } else {
            // Fallback on earlier versions
            line.backgroundColor = UIColor.borderLineColor_0()
        }
        toolView.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.left.equalTo(toolView)
            make.height.equalTo(1)
            make.bottom.equalTo(toolView).offset(-1)
            make.right.equalTo(toolView)
        }
        
        return toolView
    }()

}
