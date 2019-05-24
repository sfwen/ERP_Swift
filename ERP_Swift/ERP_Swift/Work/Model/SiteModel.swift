//
//  SiteModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/3.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

enum FinSettleState : Int {
    case None = 0
    ///新建
    case AddNew = 1
    ///待核算
    case WaiCheck
    ///待结算
    case WaitPay
    ///已结算
    case Paid
    ///已无效
    case Canceled = 99
}

class SiteModel: BasicModel, JSONMappable {
    var ID : String?
    var Address : String?
    var State : FinSettleState?
    var OrderTime : String?
    var Remark : String?
    var AppSpName : String?
    var SiteState : ContectState?
    var CustName : String?
    var Addr : String?
    var CustTels : NSArray?
    
    required init(json: JSON) {
        self.ID = json["ID"].stringValue
        self.Address = json["Address"].stringValue
        self.OrderTime = json["OrderTime"].stringValue
        self.Remark = json["Remark"].stringValue
        self.AppSpName = json["AppSpName"].stringValue
        self.State = FinSettleState(rawValue:json["State"].intValue)
        self.SiteState = ContectState(rawValue:json["SiteState"].intValue)
        self.CustName = json["CustName"].stringValue
        self.Addr = json["Addr"].stringValue
        self.CustTels = json["CustTels"].arrayValue as NSArray
    }
}

func finSettleStateToStr(_ state : FinSettleState) -> String {
    var str = ""
    switch state {
    case .AddNew:
        str = "新建"
    case .WaiCheck:
        str = "待核算"
    case .WaitPay:
        str = "待结算"
    case .Paid:
        str = "已结算"
    case .Canceled:
        str = "已无效"
    default:
        break
    }
    return str
}
