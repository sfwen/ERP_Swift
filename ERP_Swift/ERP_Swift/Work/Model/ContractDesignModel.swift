//
//  ContractDesignModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/3.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON

enum ContDesignRoyaltyState : Int {
    case None = 0//
    ///提成未处理
    case RoyaltyUntreated
    ///提成处理中
    case RoyaltyTreating
    ///提成处理完成
    case RoyaltyTreated
}

enum OffcGoodsAchvState : Int {
    case None = 0
    ///未写业绩
    case NoWrite
    ///已写业绩
    case Added
    ///业绩变动
    case Changed
}

class ContractDesignModel: BasicModel {
    let customerTel : String
    let desnName : String
    let reConAmount : Double
    let conAmount : Double
    let updtTime : String
    let coID : String
    let iD : String
    let fristReceivables : Double
    let state : Int
    let lastReceivables : Double
    let isByStages : Bool
    let flowState : FlowStateType
    let operID : String
    let oper : String
    let creTime : String
    let customerName : String
    let no : String
    let remark : String
    let customerID : String
    let appSpID : String
    let royaltyState : ContDesignRoyaltyState
    let desnID : String
    let writingAchvState : OffcGoodsAchvState
    let contDate : String
    let custNo : String
    let uniqueID : String
    
    
    
//    required init(json: JSON) {
//        self.CustomerName = json["CustomerName"].stringValue
//        self.ID = json["ID"].stringValue
//        self.Remark = json["Remark"].stringValue
//        self.RoyaltyState = ContDesignRoyaltyState(rawValue:json["RoyaltyState"].intValue)
//        self.WritingAchvState = OffcGoodsAchvState(rawValue:json["WritingAchvState"].intValue)
//        self.FlowState = FlowStateType(rawValue:json["FlowState"].intValue)
//    }

    init(json:JSON){
        self.customerTel =  json["CustomerTel"].stringValue
        self.desnName =  json["DesnName"].stringValue
        self.reConAmount =  json["ReConAmount"].doubleValue
        self.conAmount =  json["ConAmount"].doubleValue
        self.updtTime =  json["UpdtTime"].stringValue
        self.coID =  json["CoID"].stringValue
        self.iD =  json["ID"].stringValue
        self.fristReceivables =  json["FristReceivables"].doubleValue
        self.state =  json["State"].intValue
        self.lastReceivables =  json["LastReceivables"].doubleValue
        self.isByStages =  json["IsByStages"].boolValue
        self.flowState =  FlowStateType(rawValue: json["FlowState"].intValue)!
        self.operID =  json["OperID"].stringValue
        self.oper =  json["Oper"].stringValue
        self.creTime =  json["CreTime"].stringValue
        self.customerName =  json["CustomerName"].stringValue
        self.no =  json["No"].stringValue
        self.remark =  json["Remark"].stringValue
        self.customerID =  json["CustomerID"].stringValue
        self.appSpID =  json["AppSpID"].stringValue
        self.royaltyState =  ContDesignRoyaltyState(rawValue: json["RoyaltyState"].intValue)!
        self.desnID =  json["DesnID"].stringValue
        self.writingAchvState =  OffcGoodsAchvState(rawValue: json["WritingAchvState"].intValue)!
        self.contDate =  json["ContDate"].stringValue
        self.custNo =  json["CustNo"].stringValue
        self.uniqueID =  json["UniqueID"].stringValue
    }
    
    func toDict() -> [String:Any]{
        var dict : [String:Any] = [ : ]
        dict["CustomerTel"] = self.customerTel
        dict["DesnName"] = self.desnName
        dict["ReConAmount"] = self.reConAmount
        dict["ConAmount"] = self.conAmount
        dict["UpdtTime"] = self.updtTime
        dict["CoID"] = self.coID
        dict["ID"] = self.iD
        dict["FristReceivables"] = self.fristReceivables
        dict["State"] = self.state
        dict["LastReceivables"] = self.lastReceivables
        dict["IsByStages"] = self.isByStages
        dict["FlowState"] = self.flowState
        dict["OperID"] = self.operID
        dict["Oper"] = self.oper
        dict["CreTime"] = self.creTime
        dict["CustomerName"] = self.customerName
        dict["No"] = self.no
        dict["Remark"] = self.remark
        dict["CustomerID"] = self.customerID
        dict["AppSpID"] = self.appSpID
        dict["RoyaltyState"] = self.royaltyState
        dict["DesnID"] = self.desnID
        dict["WritingAchvState"] = self.writingAchvState
        dict["ContDate"] = self.contDate
        dict["CustNo"] = self.custNo
        dict["UniqueID"] = self.uniqueID
        return dict
    }
    
    func getBasicInfoArray() -> NSMutableArray {
        let baseInfoArray = NSMutableArray.init()
        var model = PubNormalModel.init()
        model.title = "合同编号"
        model.desc = self.no
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "客户编号"
        model.desc = self.custNo
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "合同金额"
        model.desc = String(format:"%.2f", self.conAmount) + "元"
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "首付款"
        model.desc = String(format:"%.2f", self.fristReceivables) + "元"
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "尾款"
        model.desc = String(format:"%.2f", self.lastReceivables) + "元"
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "已收金额"
        model.desc = String(format:"%.2f", self.reConAmount) + "元"
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "是否分期"
        model.desc = BoolToStr(self.isByStages)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "设计师"
        model.desc = self.desnName
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "签单日期"
        model.desc = self.contDate.substring(toIndex: 10)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "流程状态"
        model.desc = flowStateToStr(self.flowState)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "提成状态"
        model.desc = contractTextContDesignRoyaltyState(self.royaltyState)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "业绩状态"
        model.desc = textOffcGoodsAchvState(self.writingAchvState)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "创建人"
        model.desc = self.oper
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "创建时间"
        model.desc = self.creTime.substring(toIndex: 10)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "备注信息"
        model.desc = self.remark
        baseInfoArray.add(model)
        
        return baseInfoArray
    }
}

func contractTextContDesignRoyaltyState(_ royaltyState : ContDesignRoyaltyState) -> String {
    var str = ""
    switch royaltyState {
    case .RoyaltyTreated:
        str = "提成处理完成"
    case.RoyaltyTreating:
        str = "提成处理中"
    case.RoyaltyUntreated:
        str = "提成未处理"
    default:
        break
    }
    return str
}

func textOffcGoodsAchvState(_ writingAchvState : OffcGoodsAchvState) -> String {
    var str = ""
    switch writingAchvState {
    case .Changed:
        str = "业绩变动"
    case.Added:
        str = "已写业绩"
    case.NoWrite:
        str = "未写业绩"
    default:
        break
    }
    return str
}


