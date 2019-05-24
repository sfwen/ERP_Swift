//
//  UIColor+Extension.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/15.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

extension UIColor {
    //MARK: - RGB
    class func RGBColor(red : CGFloat, green : CGFloat, blue :CGFloat ) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha:1)
    }
    
    class func RGBColor(_ RGB:CGFloat) -> UIColor {
        return RGBColor(red: RGB, green: RGB, blue: RGB)
    }
    
    //MARK: - 16进制字符串转UIColor
    class func colorWithHexString(_ hex:String) ->UIColor {
        return colorWithHexString(hex, alpha:1)
    }
    
    class func colorWithHexString (_ hex:String, alpha:CGFloat) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from:1)
        } else if (cString.hasPrefix("0X") || cString.hasPrefix("0x")) {
            cString = (cString as NSString).substring(to: 2)
        }
        
        if ((cString as NSString).length != 6) {
            return gray
        }
        
        let rString = (cString as NSString).substring(to:2)
        let gString = ((cString as NSString).substring(from:2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from:4) as NSString).substring(to: 2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}

//常用的颜色

extension UIColor{
    //主题色
    class func normalColor() -> UIColor {
        return colorWithHexString("#8ebf30")
    }
    
    //浅灰色
    class func color666() -> UIColor {
        return colorWithHexString("#666666")
    }
    
    //标题主题色
    class func color333() -> UIColor {
        return colorWithHexString("#333333")
    }
    
    //描述文字颜色
    class func color999() -> UIColor {
        return colorWithHexString("#999999")
    }
    
    //价格的颜色
    class func colorff3635() -> UIColor {
        return colorWithHexString("#ff3635")
    }
    
    //tableView背景颜色
    class func colorf6f6f6() -> UIColor {
        return colorWithHexString("#f6f6f6")
    }
    
    //分割线颜色
    class func coloreee() -> UIColor {
        return colorWithHexString("#eeeeee")
    }
    
    //分割线颜色2
    class func colore9e9e9() -> UIColor {
        return colorWithHexString("#e9e9e9")
    }
    
    //分割线颜色
    class func borderLineColor_0() -> UIColor {
        return colorWithHexString("#C8C8C8")
    }
    
    //按钮背景颜色
    class func Color_Background_Orange() -> UIColor {
        return colorWithHexString("#FF801C")
    }
    
    /// 背景色-灰
    class func Color_Background_Gray() -> UIColor {
        return colorWithHexString("#cfcfcf")
    }
    /// 背景色-灰-1
    class func Color_Background_Gray_1() -> UIColor {
        return colorWithHexString("#7f7f7f")
    }
    /// 背景色-灰-2
    class func Color_Background_Gray_2() -> UIColor {
        return colorWithHexString("#f7f7f7")
    }
    class func Color_Background_White() -> UIColor {
        return colorWithHexString("#F0F0F0")
    }
    
    //文字颜色-黑
    class func Color_Text_Black_0() -> UIColor {
        return colorWithHexString("#222222")
    }
    
    class func Color_Text_Black_1() -> UIColor {
        return colorWithHexString("#505050")
    }
    
    class func Color_Text_Black_2() -> UIColor {
        return colorWithHexString("#626262")
    }
//
    class func Color_Text_Blue_0() -> UIColor {
        return colorWithHexString("#2F5090")
    }
    
    /// 文字颜色-灰
    class func Color_Text_Gray_0() -> UIColor {
        return colorWithHexString("#7f7f7f")
    }
    
    class func Color_Text_Gray_1() -> UIColor {
        return colorWithHexString("#A2A2A2")
    }
    
    class func Color_Text_Orange() -> UIColor {
        return colorWithHexString("#fa7313")
    }
}
