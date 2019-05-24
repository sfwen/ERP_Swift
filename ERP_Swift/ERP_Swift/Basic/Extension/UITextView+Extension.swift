//
//  UITextView+Extension.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/13.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

//private var placeholderKey = "placeholderLabel"
//
//extension UITextView {
//    
//    
//    var placeholder: UILabel {
//        var lab : UILabel? = objc_getAssociatedObject(self, &placeholderKey) as? UILabel
//        if lab == nil {
//            let originalText = self.attributedText
//            self.text = ""
//            self.attributedText = originalText
//            
//            lab = UILabel.init()
//            lab?.textColor = UIColor.lightGray
//            lab?.numberOfLines = 0
//            lab?.isUserInteractionEnabled = false
//            
//            //关联属性
//            objc_setAssociatedObject(self, &placeholderKey, lab, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            
//            //监听属性变化
//            NotificationCenter.default.addObserver(self, selector: #selector(self.updatePlasceholder), name: NSNotification.Name.UITextViewTextDidChange, object: self)
//            
//            let observingKeys = ["attributedText", "bounds", "font", "frame", "textAlignment", "textContainerInset"]
//            for key in observingKeys {
//                //设置监听
//                self.addObserver(self, forKeyPath: key, options: .new, context: nil)
//            }
//            
//            let hooker = DeallocHooker()
//            //
//            hooker.deallocHandle = {
//                NotificationCenter.default.removeObserver(self)
//                for key in observingKeys {
//                    self.removeObserver(self, forKeyPath: key)
//                }
//            }
//            
//            objc_setAssociatedObject(self, &AssociatedKeys.deallocHooker, hooker, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//        return lab!
//    }
//    
//    @objc func updatePlasceholder() -> Void {
//        
//    }
//    
//    class DeallocHooker: NSObject {
//        var deallocHandle : WillDealloc?
//        deinit {
//            if deallocHandle != nil {
//                deallocHandle()
//            }
//        }
//    }
//}


