//
//  PubNormalModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/8.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

enum ModelDataType : Int {
    /// 无任何状态
    case none = 0
    /// 联系人
    case Contact
    /// 文字详情-不可编辑
    case TextDetail
    /// 文字详情-可编辑
    case EditTextDetail
    /// 图片，只做展示
    case Image_OnlyShow
    /// 日期选择
    case Time_Select
}

class PubNormalModel: NSObject {
    var title : String?
    var desc : String?
    var placeHolder : String?
    var showArrow : Bool? = false
    
    var showContent : String?
    var dataType : ModelDataType = ModelDataType.none
    
    var isSelected : Bool = false
    var contentArray : NSMutableArray = NSMutableArray.init()
    var value : Int = -1
    /// 是否支持多选
    var isMultiSelected : Bool = false
    var selectedValue : Int = 0
    
}

