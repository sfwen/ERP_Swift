//
//  UIbutton+Extension.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/1.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import Foundation

enum ButtonImageEdgeInsetsStyle {
    case top    //上图下文字
    case left   //左图右文字
    case bottom //下图上文字
    case right  //右图左文字
}

extension UIButton {
    struct cs_associatedKeys {
        static var accpetEventInterval = "cs_acceptEventInterval"
        static var acceptEventTime = "cs_acceptEventTime"
    }
    
    /// 重复点击的时间间隔--自己手动随意设置
    /// 利用运行时机制 将accpetEventInterval值修改
    var cs_accpetEventInterval: TimeInterval {
        get {
            if let accpetEventInterval = objc_getAssociatedObject(self, &cs_associatedKeys.accpetEventInterval) as? TimeInterval {
                return accpetEventInterval
            }
            return 1.0
        }
        set {
            objc_setAssociatedObject(self, &cs_associatedKeys.accpetEventInterval, newValue as TimeInterval, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /**
     重复点击的时间间隔--自己手动随意设置
     利用运行时机制 将acceptEventTime值修改
     */
    var cs_acceptEventTime : TimeInterval {
        get {
            if let acceptEventTime = objc_getAssociatedObject(self, &cs_associatedKeys.acceptEventTime) as? TimeInterval {
                return acceptEventTime
            }
            return 1.0
        }
        set {
            objc_setAssociatedObject(self, &cs_associatedKeys.acceptEventTime, newValue as TimeInterval, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /**
     重写初始化方法,在这个方法中实现在运行时方法替换
     */
    class func initializeMethod() {
        let changeBefore: Method = class_getInstanceMethod(self, #selector(UIButton.sendAction(_:to:for:)))!
        let changeAfter: Method = class_getInstanceMethod(self, #selector(UIButton.cs_sendAction(action:to:for:)))!
        method_exchangeImplementations(changeBefore, changeAfter)
    }
    
    /**
     在这个方法中判断接收到当前事件的时间间隔是否满足我们所设定的间隔,会一直循环调用到满足才会return
     */
    @objc func cs_sendAction(action: Selector, to target: AnyObject?, for event: UIEvent?) {
        if NSDate().timeIntervalSince1970 - self.cs_acceptEventTime < self.cs_accpetEventInterval {
            return
        }
        if self.cs_accpetEventInterval > 0 {
            self.cs_acceptEventTime = NSDate().timeIntervalSince1970
        }
        self.cs_sendAction(action: action, to: target, for: event)
    }
    
    /// 设置UIButton 图片文字方向和距离
    ///
    /// - Parameters:
    ///   - style: 图片位置
    ///   - space: 图片与文字的距离
    func layoutButtonImageEdgeInsetsStyle(style:ButtonImageEdgeInsetsStyle,space:CGFloat) {
        let imageWidth:CGFloat = (self.imageView?.frame.size.width)!
        let imageHeight:CGFloat = (self.imageView?.frame.size.height)!
        
        var labelWidth:CGFloat = 0
        var labelHeight:CGFloat = 0
        
        labelWidth = (self.titleLabel?.intrinsicContentSize.width)!
        labelHeight = (self.titleLabel?.intrinsicContentSize.height)!
        
        var imageEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets:UIEdgeInsets = UIEdgeInsets.zero
        
        switch style {
        case .top:
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight-space/2.0, 0)
        case .left:
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0)
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0)
        case .bottom:
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth)
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWidth, 0, 0)
        case .right:
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsetsMake(0, -labelWidth-space/2.0, 0, labelWidth+space/2.0)
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
    }
    
}
