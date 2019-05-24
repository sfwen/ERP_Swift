//
//  GeneralTextViewViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/13.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class GeneralTextViewViewController: UIViewController {
    /// 目前这个不起作用
    var placeholder : String = ""
    var contentText : String = ""
    var navTitle : String = "详情"
    var editDisable : Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = self.navTitle
        self.textView.isEditable = self.editDisable
        self.textView.text = self.contentText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private lazy var textView : UITextView = {
        let textView = UITextView.init()
        textView.font = UIFont.systemFont(ofSize: CGFloat(kTitileFont))
        self.view.addSubview(textView)
        textView.snp.makeConstraints({ (make) in
            make.left.top.right.bottom.equalTo(self.view)
        })
        return textView
    }()

}
