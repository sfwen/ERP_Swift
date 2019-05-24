//
//  ContractModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/2.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable

enum ContectState : Int {
    case None = 0
    /// 新建
    case New = 1
    /// 待开工
    case WaitStart
    /// 已申请开工
    case Started
    /// 施工中
    case Abuilding
    /// 报停
    case StopWork
    /// 完工
    case Finished
    /// 待决算
    case WaitSettle
    /// 已退单
    case BackOrder
    /// 已决算
    case Settled
    /// 已取消
    case Canceled = 99
}

enum HouseCatg : Int {
    /// 期房
    case PreSell
    /// 现房
    case Existing
}

class ContractModel: BasicModel {
    let remark : String
    /// 房屋面积
    let area : String
    /// 套餐类型
    let packageCatg : String
    /// 签单金额
    let signAmount : Int
    let contStartID : String
    let iD : String
    /// 样板间号
    let modelRoomNo : String
    /// 客户姓名
    let custName : NSArray
    /// 签单人
    let signPerson : String
    let desnName : String
    /// 客户电话
    let custTel : NSArray
    /// 工期
    let timeLimit : Int
    let latitude : Int
    let longitude : Int
    let isSubcont : Bool
    let pMID : String
    let desnID : String
    /// 房屋户型
    let houseType : String
    /// 是否改签
    let isAlterSign : Bool
    let oper : String
    /// 预计开工日期
    let expectStartDate : String
    /// 开工日期
    let startDate : String
    /// 周末是否施工
    let canWeekendConstruction : Bool
    /// 是否开工后核算提成
    let isCompletedCommission : Bool
    /// 装修管家
    let projectManagerName : String
    /// 是否贷款
    let isLoan : Bool
    let coCmplDate : String
    let proCatg : Int
    let buildings : String
    let areaID : String
    /// 交房日期
    let getDate : String
    /// 预计收房日期
    let expectGetDate : String
    /// 是否撞单
    let isClash : Bool
    let flowState : Int
    let creTime : String
    let uniqueID : String
    let bldID : String
    /// 合同状态
    let contState : ContectState
    /// 签单日期
    let signDate : String
    let coID : String
    /// 房屋地址
    let houseAddress : String
    let coName : String
    let custID : String
    /// 房屋面积
    let houseArea : Int
    /// 是否开工后核算业绩
    let isBegunAchievement : Bool
    /// 项目地址
    let bldName : String
    /// 合同编号
    let contNo : String
    let updtTime : String
    let operID : String
    let houseCatg : Int
    
    init(json:JSON){
        self.remark =  json["Remark"].stringValue
        self.area =  json["Area"].stringValue
        self.packageCatg =  json["PackageCatg"].stringValue
        self.signAmount =  json["SignAmount"].intValue
        self.contStartID =  json["ContStartID"].stringValue
        self.iD =  json["ID"].stringValue
        self.modelRoomNo =  json["ModelRoomNo"].stringValue
        self.custName =  json["CustName"].arrayValue as NSArray
        self.signPerson =  json["SignPerson"].stringValue
        self.desnName =  json["DesnName"].stringValue
        self.custTel =  json["CustTel"].arrayValue as NSArray
        self.timeLimit =  json["TimeLimit"].intValue
        self.latitude =  json["Latitude"].intValue
        self.longitude =  json["Longitude"].intValue
        self.isSubcont =  json["IsSubcont"].boolValue
        self.pMID =  json["PMID"].stringValue
        self.desnID =  json["DesnID"].stringValue
        self.houseType =  json["HouseType"].stringValue
        self.isAlterSign =  json["IsAlterSign"].boolValue
        self.oper =  json["Oper"].stringValue
        self.expectStartDate =  json["ExpectStartDate"].stringValue
        self.startDate =  json["StartDate"].stringValue
        self.canWeekendConstruction =  json["CanWeekendConstruction"].boolValue
        self.isCompletedCommission =  json["IsCompletedCommission"].boolValue
        self.projectManagerName =  json["ProjectManagerName"].stringValue
        self.isLoan =  json["IsLoan"].boolValue
        self.coCmplDate =  json["CoCmplDate"].stringValue
        self.proCatg =  json["ProCatg"].intValue
        self.buildings =  json["Buildings"].stringValue
        self.areaID =  json["AreaID"].stringValue
        self.getDate =  json["GetDate"].stringValue
        self.expectGetDate =  json["ExpectGetDate"].stringValue
        self.isClash =  json["IsClash"].boolValue
        self.flowState =  json["FlowState"].intValue
        self.creTime =  json["CreTime"].stringValue
        self.uniqueID =  json["UniqueID"].stringValue
        self.bldID =  json["BldID"].stringValue
        self.contState =  ContectState(rawValue: json["ContState"].intValue)!
        self.signDate =  json["SignDate"].stringValue
        self.coID =  json["CoID"].stringValue
        self.houseAddress =  json["HouseAddress"].stringValue
        self.coName =  json["CoName"].stringValue
        self.custID =  json["CustID"].stringValue
        self.houseArea =  json["HouseArea"].intValue
        self.isBegunAchievement =  json["IsBegunAchievement"].boolValue
        self.bldName =  json["BldName"].stringValue
        self.contNo =  json["ContNo"].stringValue
        self.updtTime =  json["UpdtTime"].stringValue
        self.operID =  json["OperID"].stringValue
        self.houseCatg =  json["HouseCatg"].intValue
    }
    
    func toDict() -> [String:Any]{
        var dict : [String:Any] = [ : ]
        dict["Remark"] = self.remark
        dict["Area"] = self.area
        dict["PackageCatg"] = self.packageCatg
        dict["SignAmount"] = self.signAmount
        dict["ContStartID"] = self.contStartID
        dict["ID"] = self.iD
        dict["ModelRoomNo"] = self.modelRoomNo
        dict["CustName"] = self.custName
        dict["SignPerson"] = self.signPerson
        dict["DesnName"] = self.desnName
        dict["CustTel"] = self.custTel
        dict["TimeLimit"] = self.timeLimit
        dict["Latitude"] = self.latitude
        dict["Longitude"] = self.longitude
        dict["IsSubcont"] = self.isSubcont
        dict["PMID"] = self.pMID
        dict["DesnID"] = self.desnID
        dict["HouseType"] = self.houseType
        dict["IsAlterSign"] = self.isAlterSign
        dict["Oper"] = self.oper
        dict["ExpectStartDate"] = self.expectStartDate
        dict["StartDate"] = self.startDate
        dict["CanWeekendConstruction"] = self.canWeekendConstruction
        dict["IsCompletedCommission"] = self.isCompletedCommission
        dict["ProjectManagerName"] = self.projectManagerName
        dict["IsLoan"] = self.isLoan
        dict["CoCmplDate"] = self.coCmplDate
        dict["ProCatg"] = self.proCatg
        dict["Buildings"] = self.buildings
        dict["AreaID"] = self.areaID
        dict["GetDate"] = self.getDate
        dict["ExpectGetDate"] = self.expectGetDate
        dict["IsClash"] = self.isClash
        dict["FlowState"] = self.flowState
        dict["CreTime"] = self.creTime
        dict["UniqueID"] = self.uniqueID
        dict["BldID"] = self.bldID
        dict["ContState"] = self.contState
        dict["SignDate"] = self.signDate
        dict["CoID"] = self.coID
        dict["HouseAddress"] = self.houseAddress
        dict["CoName"] = self.coName
        dict["CustID"] = self.custID
        dict["HouseArea"] = self.houseArea
        dict["IsBegunAchievement"] = self.isBegunAchievement
        dict["BldName"] = self.bldName
        dict["ContNo"] = self.contNo
        dict["UpdtTime"] = self.updtTime
        dict["OperID"] = self.operID
        dict["HouseCatg"] = self.houseCatg
        return dict
    }
    
    func getBasicInfoArray() -> NSMutableArray {
        let baseInfoArray = NSMutableArray.init()
        var model = PubNormalModel.init()
        model.title = "房屋地址"
        model.desc = self.houseAddress
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "所在区域"
        model.desc = self.area
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "合同编号"
        model.desc = self.contNo
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "签单金额"
        model.desc = String(format:"%.2f", self.signAmount) + "元"
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "套餐类型"
        model.desc = self.packageCatg
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "签单日期"
        model.desc = self.signDate.substring(toIndex: 10)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "合同状态"
        model.desc = contStateToStr(self.contState)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "是否开工后算业绩"
        model.showContent = BoolToStr(self.isBegunAchievement)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "是否开工后核算提成"
        model.showContent = BoolToStr(self.isCompletedCommission)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "样板间号"
        model.showContent = self.modelRoomNo
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "签单人"
        model.showContent = self.signPerson
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "是否改签"
        model.showContent = BoolToStr(self.isAlterSign)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "是否撞单"
        model.showContent = BoolToStr(self.isClash)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "房屋户型"
        model.showContent = self.houseType
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "房屋面积"
        model.showContent = String.init(format: "%.2㎡", self.houseArea)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "房屋类别"
        model.showContent = houseCatgToStr(HouseCatg(rawValue: self.houseCatg)!)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "交房日期"
        model.desc = self.getDate.substring(toIndex: 10)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "是否贷款"
        model.showContent = BoolToStr(self.isLoan)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "装修管家"
        model.showContent = self.projectManagerName
        model.showArrow = true
        model.showContent = self.pMID
        model.dataType = ModelDataType.Contact
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "开工日期"
        model.desc = self.startDate.substring(toIndex: 10)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "预计开工日期"
        model.desc = self.expectStartDate.substring(toIndex: 10)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "预计收房日期"
        model.desc = self.expectGetDate.substring(toIndex: 10)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "工期"
        model.desc = String.init(format: "%d天", self.timeLimit)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "周末是否施工"
        model.desc = BoolToStr(self.canWeekendConstruction)
        baseInfoArray.add(model)
        
        model = PubNormalModel.init()
        model.title = "备注"
        model.desc = self.remark
        model.showArrow = true
        model.showContent = self.remark
        model.dataType = ModelDataType.TextDetail
        baseInfoArray.add(model)
        
        return baseInfoArray
    }
}




func contStateToStr(_ contState : ContectState) -> String {
    var str = " "
    switch contState {
    case .New:
        str = "新建"
    case .WaitStart:
        str = "待开工"
    case .Started:
        str = "已申请开工"
    case .Abuilding:
        str = "施工中"
    case .StopWork:
        str = "已报停"
    case .Finished:
        str = "已完工"
    case .BackOrder:
        str = "已退单"
    case .Settled:
        str = "已决算"
    case .Canceled:
        str = "已取消"
    case .WaitSettle:
        str = "待决算"
    default:
        str = ""
    }
    
    return str
}

func houseCatgToStr(_ houseCatg : HouseCatg) -> String {
    var str = ""
    switch houseCatg {
    case .PreSell:
        str = "期房"
    case .Existing:
        str = "现房"
    }
    return str
}
