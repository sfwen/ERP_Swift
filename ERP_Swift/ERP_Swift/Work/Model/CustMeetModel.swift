//
//  CustMeetModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/2.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

enum CustMeetState : Int {
    ///新建
    case AddNew = 1
    ///已见面
    case MeetCust
    ///已交定金
    case Deposit
    ///已签合同
    case Contract
    ///已无效
   case Invalid
}

class CustMeetModel: BasicModel, JSONMappable {
    var ID : String?
    /// 设计师
    var DsgnName : String?
    /// 设计师ID
    var DsgnSpID : String?
    var CoName : String?
    var CreTime : String?
    var Cust : CustomModel?
    var NO : String?
    /// 家装顾问
    var Apper : String?
    var AppSpID : String?
    var State : CustMeetState?
    /// 流程状态
    var FlowState : FlowNodeLogState?
    /// 备注
    var Remark : String?
    
    
    required init(json: JSON) {
        self.ID = json["ID"].stringValue
        self.CoName = json["CoName"].stringValue
        self.CreTime = json["CreTime"].stringValue
        self.DsgnName = json["DsgnName"].stringValue
        self.Cust = CustomModel(json: json["Cust"])
        self.NO = json["No"].stringValue
        self.Apper = json["Apper"].stringValue
        self.AppSpID = json["AppSpID"].stringValue
        self.DsgnSpID = json["DsgnSpID"].stringValue
        self.State = CustMeetState(rawValue: json["State"].intValue)
        self.FlowState = FlowNodeLogState(rawValue: json["FlowState"].intValue)
        self.Remark = json["Remark"].stringValue
    }
    
    func getBasicInfoArray() -> NSMutableArray {
        let baseInfoArray = NSMutableArray.init()
        var model = PubNormalModel.init()
        model.title = "创建时间"
        model.desc = self.CreTime?.substring(toIndex: 16)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "单据编号"
        model.desc = self.NO
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "家装顾问"
        model.showArrow = true
        model.showContent = self.AppSpID
        model.desc = self.Apper
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "设计师"
        model.showArrow = true
        model.showContent = self.DsgnSpID
        model.desc = self.DsgnName
        model.dataType = ModelDataType.Contact
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "区域名称"
        model.desc = self.Cust?.AreaName
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "客户地址"
        model.desc = self.Cust?.Address
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "单据状态"
        model.desc = custMeetStateToStr(self.State!)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "流程状态"
        model.desc = flowNodeLogStateToStr(self.FlowState!)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "备注"
        model.showArrow = true
        model.showContent = self.Remark
        model.desc = self.Remark
        model.dataType = ModelDataType.TextDetail
        baseInfoArray.add(model)
        
        return baseInfoArray
    }
}

func custMeetStateToStr(_ state : CustMeetState) -> String {
    var str = ""
    switch state {
    case .AddNew:
        str = "新建"
    case .MeetCust:
        str = "已见面"
    case .Deposit:
        str = "已交定金"
    case .Contract:
        str = "已签合同"
    case .Invalid:
        str = "已无效"
    }
    return str
}
