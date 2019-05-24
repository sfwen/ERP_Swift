//
//  UserInfoManager.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/17.
//  Copyright © 2018年 Land. All rights reserved.
//

import Foundation
import SwiftyJSON

let Right_Public = "Right_Public"

let Right_Menu_MyMeetCus = "见面申请_查看";// @"见面客户" 
let Menu_MyMeetCus_Titile = "见面申请"
let Menu_MyMeetCus_Img = "Menu_MyMeetCus_Img"

let Right_Menu_Cont = "合同登记_查看";// @"合同"
let Menu_Cont_Title = "合同"
let Menu_Cont_Img = "Menu_Cont_Img"

let Right_Menu_ContStart = "开工申请单_查看";// @"开工申请"
let Menu_ContStart_Title = "开工申请"
let Menu_ContStart_Img = "Menu_ContStart_Img"

let Right_Menu_ConstructAccept_Look = "开工验收申请_查看";//开工验收申请_查看
let Menu_ConstructAccept_Title = "开工验收申请"
let Menu_ConstructAccept_Img = "Menu_ContStart_Img"

let Right_Menu_WaitQc = "工地验收单_查看";// @"工地验收单"
let Menu_WaitQc_Title = "工地验收单"
let Menu_WaitQc_Img = "Menu_WaitQc_Img"

let Right_Menu_Site = "工地查询_查看";// @"工地"
let Menu_Site_Title = "工地"
let Menu_Site_Img = "Menu_Site_Img"

let Right_Menu_MatlPur = "材料采购单_查看";// @"材料采购单"
let Menu_MatlPur_Title = "采购单"
let Menu_MatlPur_Img = "Menu_MatlPur_Img"

let Right_Menu_MatlNeed = "工地用料单_查看";// @"工地用料单"
let Menu_MatlNeed_Title = "工地用料单"
let Menu_MatlNeed_Img = "Menu_MatlNeed_Img"

let Right_Menu_Rectify = "工地整改单_查看";// @"整改单"
let Menu_Rectify_Title = "整改单"
let Menu_Rectify_Img = "Menu_Rectify_Img"

let Right_Menu_StopRst = "工地停复工登记_查看";// @"停复工登记"
let Menu_StopRst_Title = "停工登记"
let Menu_StopRst_Img = "Menu_StopRst_Img"

let Right_Menu_SiteCmpl = "工地完工登记_查看";// @"完工登记"
let Menu_SiteCmpl_Title = "完工登记"
let Menu_SiteCmpl_Img = "Menu_SiteCmpl_Img"

let Right_Menu_StartDateChg = "开工日期变更_查看";// @"开工日期变更"
let Menu_StartDateChg_Title = "开工日期变更"
let Menu_StartDateChg_Img = "Menu_StartDateChg_Img"

let  Right_Menu_PersonChg = "工地人员变更_编辑";// @"工地人员变更"
let Menu_PersonChg_Title = "装修管家变更"
let Menu_PersonChg_Img = "Menu_PersonChg_Img"

let Right_Menu_Liaison = "工作联络单_查看";// @"工作联络单"
let Menu_Liaison_Title = "工作联络单"
let Menu_Liaison_Img = "Menu_Liaison_Img"

let Right_Menu_CheckHouse = "验房申请单_查看";// @"验房申请单"
let Menu_CheckHouse_Title = "验房申请单"
let Menu_CheckHouse_Img = "Menu_CheckHouse_Img"

let Right_Menu_CheckHouseRefund = "验房退款单_查看";// @"验房退款单"
let Menu_CheckHouseRefund_Title = "验房退款单"
let Menu_CheckHouseRefund_Img = "Menu_CheckHouseRefund_Img"

let Right_Menu_Earnest = "定金登记_查看";// @"定金登记"
let Menu_Earnest_Title = "定金登记"
let Menu_Earnest_Img = "Menu_Earnest_Img"

let Right_Menu_EarnestRefund = "定金退款单_查看";// @"定金退款"
let Menu_EarnestRefund_Title = "定金退款"
let Menu_EarnestRefund_Img = "Menu_EarnestRefund_Img"

let Right_Menu_FinRequest = "请款申请单_查看";// @"请款申请"
let Menu_FinRequest_Title = "请款申请"
let Menu_FinRequest_Img = "Menu_FinRequest_Img"

let Right_Menu_OnDuty = "值班模式设置_查看";// @"值班模式设置"
let Menu_OnDuty_Title = "值班模式设置"
let Menu_OnDuty_Img = "Menu_OnDuty_Img"

let Right_Menu_CheckHouseAcpt = "签单客户验房登记_查看";// @"验房单"
let Menu_CheckHouseAcpt_Title = "验房登记"
let Menu_CheckHouseAcpt_Img = "Menu_CheckHouseAcpt_Img"

let Right_Menu_ContHydropower = "水电增项单_查看";// @"水电增项单"
let Menu_ContHydropower_Title = "水电增项单"
let Menu_ContHydropower_Img = "Menu_ContHydropower_Img"

let Right_Menu_RepairRecord = "售后维修日志_查看";// @"维修记录"
let Menu_RepairRecord_Title = "维修记录"
let Menu_RepairRecord_Img = "Menu_RepairRecord_Img"

let Right_Menu_DsgnChg = "合同设计师变更单_查看";
let Menu_ContDsgnChg_Title = "合同设计师变更"
let Menu_ContDsgnChg_Img = "Menu_RepairRecord_Img"

let Right_Menu_MatlConfirm = "主材确认单_查看"
let Menu_MatlConfirm_Title = "主材确认单"
let Menu_MatlConfirm_Img = "Menu_RepairRecord_Img"

let Right_Menu_Fabao = "工人发包发放申请_查看";
let Menu_Fabao_Title = "工人发包发放申请"
let Menu_Fabao_Img = "Menu_RepairRecord_Img"

let Right_Menu_Fabao_Document = "项目发包单_查看"
let Menu_Fabao_Document_Title = "项目发包单"
let Menu_Fabao_Document_Img = "Menu_RepairRecord_Img"

let Right_Menu_CustProm = "推广费用申请_查看"
let Menu_CustProm_Title = "客户推广费用申请"
let Menu_CustProm_Img = "Menu_RepairRecord_Img"

let Right_Menu_SiteTimeAdjust = "工地工期调整单_查看";//工地工期调整
let Menu_SiteTimeAdjust_Title = "工地工期调整"

let Right_Menu_MaterialStorage_Look = "物资采购入库单_查看"
let Right_Menu_MaterialStorage_Edit = "物资采购入库单_编辑"
let Right_Menu_MaterialStorage_In   = "物资采购入库单_入库"
let Menu_MaterialStorage_Titile = "物资采购入库单"

let Right_Menu_Notice_Measure_Look = "测量通知单_查看"
let Right_Menu_Notice_Measure_Edit = "测量通知单_编辑"
let Menu_Measure_Title = "测量通知单"

let Right_Menu_Notice_Install_Look = "安装通知单_查看"
let Right_Menu_Notice_Install_Edit = "安装通知单_编辑"
let Menu_Install_Title = "安装通知单"

let Right_Menu_FinSettleOtherOut_Look = "报销申请单_查看"
let Right_Menu_FinSettleOtherOut_Edit = "报销申请单_编辑"
let Menu_FinSettleOtherOut_Title = "报销申请单"

let Right_Menu_MeetingRoom_Look = "会议室申请_查看"
let Right_Menu_MeetingRoom_Edit = "会议室申请_编辑"
let Menu_MeetingRoom_Title = "会议室申请"

let Right_Menu_SiteFeeApply_Look = "工地费用报销单_查看"
let Right_Menu_SiteFeeApply_Edit = "工地费用报销单_编辑"
let Menu_Site_FeeApply_Title = "工地费用报销单"

let Right_Menu_SiteStart_Look = "开工确认单_查看"
let Right_Menu_SiteStart_Edit = "开工确认单_编辑"
let Menu_SiteStart_Title = "开工确认单"

let Right_Menu_DutySchedule_Look = "值班安排记录_查看"
let Right_Menu_DutySchedule_Edit = "值班安排记录_编辑"
let Right_Menu_DutySchedule_Sure = "值班安排记录_确认值班"
let Menu_DutySchedule_Title = "值班安排记录"

let Right_Menu_VisitCustomer_Look = "回访满意度明细_查看"
let Menu_VisitCustomer_Title = "回访"

let Menu_Scene_Activity_Title = "现场活动"

let Right_Menu_ContFavourable_Look = "合同优惠单_查看"
let Right_Menu_ContFavourable_Edit = "合同优惠单_编辑"
let Right_Menu_ContFavourable_Outbound = "合同优惠单_出库"
let Right_Menu_ContFavourable_Revert = "合同优惠单_归还"
let Menu_ContFavourable_Title = "合同优惠"

let Right_Menu_PromoteCost_Form_Look = "推广费用报销_查看"
let Right_Menu_PromoteCost_Form_Edit = "推广费用报销_编辑"
let Menu_PromoteCost_Form_Title = "推广费用报销单"

let Right_Menu_DesignContract_Look = "设计合同登记_查看";
let Menu_DesignContract_Titile = "设计合同"

let Right_Site_SiteStop = "工地停复工登记_编辑";
let Menu_SiteRst_Title = "复工登记"

let Right_Registration_Evaluation_Look = "完工作品评定登记_查看";
let Menu_SiteFinishEvaluate_Title = "完工评定"


class UserInfoManager {
    static let sharedInstance = UserInfoManager()
}

var currUserInfo : CurrUserInfo {
    let info = Tools().readInfo()
    let infoData = info.data(using: .utf8, allowLossyConversion: true)
    let currUserInfo = CurrUserInfo.init(json: JSON(infoData!))
    return currUserInfo
}

var isLogined : Bool {
    let sessionID = currUserInfo.Session.SessionID
    print(sessionID!)
    return !(sessionID?.isEmpty)!
}

var requestDefaultParam : [String:Any] {
    var param : [String:Any] = [:]
//    param.setValue(currUserInfo.Session.mapString(), forKey: "Session")
    param["Session"] = currUserInfo.Session.mapString()
    return param
}

var currUserRights : NSMutableSet?

//var currUserRights : NSMutableSet {
//    let currUserRights = NSMutableSet.init()
//    currUserRights.add(Right_Public)
//    return currUserRights
//}



//var isLogined = {()->Bool in
//    print(currUserInfo.user.name as Any)
//    print(currUserInfo.session.sessionID as Any)
//    return (currUserInfo.session.sessionID?.isEmpty)!
//}()

//var commonProperty = {()->String in
//    print("Common Property1")
//    return "Common Property"
//}()




