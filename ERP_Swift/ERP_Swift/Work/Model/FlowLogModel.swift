//
//  FlowLogModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/8.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON

enum FlowNodeLogState : Int {
    case None
    ///待提交
    case WaitStart = 1
    ///已提交
    case Started
    ///待处理
    case WaitHandle
    ///已通过
    case Adopted
    ///已打回
    case Backed
    ///已中止
    case Aborted
    ///已查看
    case AlreadyView
    ///已委派
    case Delegated
    ///已失效
    case Invalid
}

enum FlowUrgency : Int {
    case none
    /// 一般
    case Normal = 1
    /// 紧急
    case Urgent
    /// 特急
    case ExtraUrgent
}

class FlowLogModel: BasicModel {
    
    let posID : String
    let iD : String
    let updtTime : String
    let stfID : String
    let coID : String
    let urgency : FlowUrgency
    let coName : String
    /// 描述
    let handleDesc : String
    /// 节点名称
    let nodeName : String
    let nodeID : String
    var state : Int
    let logState : FlowStateType
    let logID : String
    let flowCatg : FlowCatg
    let sponsorName : String
    let isCopy : Bool
    let handlerName : String
    /// 处理时间
    let handleTime : String
    let operID : String
    /// 操作人
    let oper : String
    let waitHandlerName : String
    /// 传递时间
    let creTime : String
    let isCanHandle : Bool
    let uniqueID : String
    let sponsorID : String
    /// 头像
    let operHeadPath : String
    let relateID : String
    
    let sponsorHeadPath : String
    let sponsorPosName : String
    let nodeLogs : String
    let no : String
    let flowID : String
    let keyTexts : String
    
    
    init(json:JSON){
        self.posID =  json["PosID"].stringValue
        self.iD =  json["ID"].stringValue
        self.updtTime =  json["UpdtTime"].stringValue
        self.stfID =  json["StfID"].stringValue
        self.coID =  json["CoID"].stringValue
        self.urgency =  FlowUrgency(rawValue: json["Urgency"].intValue)!
        self.relateID =  json["RelateID"].stringValue
        self.coName =  json["CoName"].stringValue
        self.handleDesc =  json["HandleDesc"].stringValue
        self.nodeName =  json["NodeName"].stringValue
        self.nodeID =  json["NodeID"].stringValue
        self.state =  json["State"].intValue
        self.logState =  FlowStateType(rawValue: json["LogState"].intValue)!
        self.logID =  json["LogID"].stringValue
        self.flowCatg =  FlowCatg(rawValue: json["FlowCatg"].intValue)!
        self.sponsorName =  json["SponsorName"].stringValue
        self.isCopy =  json["IsCopy"].boolValue
        self.handlerName =  json["HandlerName"].stringValue
        self.handleTime =  json["HandleTime"].stringValue
        self.operID =  json["OperID"].stringValue
        self.oper =  json["Oper"].stringValue
        self.waitHandlerName =  json["WaitHandlerName"].stringValue
        self.creTime =  json["CreTime"].stringValue
        self.isCanHandle =  json["IsCanHandle"].boolValue
        self.uniqueID =  json["UniqueID"].stringValue
        self.sponsorID =  json["SponsorID"].stringValue
        self.operHeadPath =  json["OperHeadPath"].stringValue
        
        self.sponsorHeadPath =  json["SponsorHeadPath"].stringValue
        self.sponsorPosName =  json["SponsorPosName"].stringValue
        self.nodeLogs =  json["NodeLogs"].stringValue
        self.no =  json["No"].stringValue
        self.flowID =  json["FlowID"].stringValue
        self.keyTexts =  json["KeyTexts"].stringValue
    }
    
    func toDict() -> [String:Any]{
        var dict : [String:Any] = [ : ]
        dict["PosID"] = self.posID
        dict["ID"] = self.iD
        dict["UpdtTime"] = self.updtTime
        dict["StfID"] = self.stfID
        dict["CoID"] = self.coID
        dict["Urgency"] = self.urgency
        dict["RelateID"] = self.relateID
        dict["CoName"] = self.coName
        dict["HandleDesc"] = self.handleDesc
        dict["NodeName"] = self.nodeName
        dict["NodeID"] = self.nodeID
        dict["State"] = self.state
        dict["LogState"] = self.logState
        dict["LogID"] = self.logID
        dict["FlowCatg"] = self.flowCatg
        dict["SponsorName"] = self.sponsorName
        dict["IsCopy"] = self.isCopy
        dict["HandlerName"] = self.handlerName
        dict["HandleTime"] = self.handleTime
        dict["OperID"] = self.operID
        dict["Oper"] = self.oper
        dict["WaitHandlerName"] = self.waitHandlerName
        dict["CreTime"] = self.creTime
        dict["IsCanHandle"] = self.isCanHandle
        dict["UniqueID"] = self.uniqueID
        dict["SponsorID"] = self.sponsorID
        dict["OperHeadPath"] = self.operHeadPath
        
        dict["SponsorHeadPath"] = self.sponsorHeadPath
        dict["SponsorPosName"] = self.sponsorPosName
        dict["NodeLogs"] = self.nodeLogs
        dict["No"] = self.no
        dict["FlowID"] = self.flowID
        dict["KeyTexts"] = self.keyTexts
        
        return dict
    }
    
    
//    required init(json: JSON) {
//        self.Oper = json["Oper"].stringValue
//        self.OperHeadPath = json["OperHeadPath"].stringValue
//        self.OperID = json["OperID"].stringValue
//        self.HandleTime = json["HandleTime"].stringValue
//        self.CreTime = json["CreTime"].stringValue
//        self.NodeName = json["NodeName"].stringValue
//        self.State = FlowNodeLogState(rawValue: json["State"].intValue)!
//        self.HandleDesc = json["HandleDesc"].stringValue
//        self.IsCanHandle = json["IsCanHandle"].boolValue
//    }
    
}

func flowNodeLogStateToStr(_ state : FlowNodeLogState) -> String {
    var str = ""
    switch state {
    case .WaitStart:
        str = "待传递"
    case .Started:
        str = "已传递"
    case .WaitHandle:
        str = "待处理"
    case .Adopted:
        str = "已通过"
    case .Backed:
        str = "已打回"
    case .Aborted:
        str = "已终止"
    case .AlreadyView:
        str = "已查看"
    case .Delegated:
        str = "已委派"
    case .Invalid:
        str = "已失效"
    case .None:
        break
    }
    return str
}

func flowUrgencyToStr(_ urgency : FlowUrgency) -> String {
    var str = ""
    switch urgency {
    case .Normal:
        str = "一般"
    case .Urgent:
        str = "紧急"
    case .ExtraUrgent:
        str = "特急"
    default:
        break
    }
    
    return str
}



/// "PosID" : "897989df-ded9-4237-aeb2-61784ec86429",
/// "UpdtTime" : "0001-01-01 00:00:00",
/// "StfID" : null,
/// "CoID" : "09a055c1-4885-47e7-a5ca-7066f16c4537",
/// "Urgency" : 1,
/// "RelateID" : "4c54bf64-ca1f-4a46-b6d4-2e516f057021",
/// "CoName" : "四川岚庭家居",
/// "HandleDesc" : null,
/// "NodeName" : "财务部经理审核",
/// "NodeID" : "d3ac8d8d-e593-4e1e-ae96-f14ef2199eb8",
/// "State" : 3,
/// "LogState" : 2,
/// "LogID" : "449b463f-b601-4091-b498-f16c3143843e",
/// "FlowCatg" : 41,
/// "SponsorName" : "TEST",
/// "IsCopy" : false,
/// "HandlerName" : "财务部\/经理",
/// "HandleTime" : null,
/// "OperID" : null,
/// "ID" : "38c621af-2ef3-4bb9-afc4-e8c59534e3f9",
/// "WaitHandlerName" : null,
/// "Oper" : "",
/// "CreTime" : "2018-07-13 14:12:06",
/// "IsCanHandle" : false,
/// "UniqueID" : "38c621af-2ef3-4bb9-afc4-e8c59534e3f9",
/// "SponsorID" : null,
/// "OperHeadPath" : null


//model(eq, hash)
//PosID;ID;UpdtTime;StfID;CoID;Urgency:i;RelateID;CoName;HandleDesc;NodeName;NodeID;State:i;LogState:i;LogID;FlowCatg:i;SponsorName;IsCopy:b;Handl



/// "SponsorHeadPath" : null,
/// "SponsorPosName" : null,
/// "ID" : "ef2be42a-2a1b-4486-b816-d392bdb1bafd",
/// "State" : 2,
/// "CreTime" : "2018-10-29 10:18:10",
/// "NodeLogs" : null,
/// "RelateID" : "592311bf-a655-478c-a06f-363506d35087",
/// "FlowID" : null,
/// "FlowCatg" : 10,
/// "Urgency" : 0,
/// "SponsorID" : null,
/// "UpdtTime" : "0001-01-01 00:00:00",
/// "KeyTexts" : null,
/// "No" : null,
/// "SponsorName" : ""

//model(eq, hash)
//SponsorHeadPath;SponsorPosName;ID;State:i;CreTime;NodeLogs;No;RelateID;FlowID;FlowCatg:i;Urgency:i;SponsorID;UpdtTime;KeyTexts;SponsorName
