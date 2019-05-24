//
//  APIMacro.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/16.
//  Copyright © 2018年 Land. All rights reserved.
//

import Foundation

let RequestRequestHeaderPrefix_General = "/General/GeneralService.svc/"
let RequestRequestHeaderPrefix_WorkflowService = "/Workflow/WorkflowService.svc/"
let RequestHeaderPrefix_Site = "/Site/SiteService.svc/"
let RequestHeaderPrefix_MyWorkService = "/MyWork/MyWorkService.svc/"
let RequestHeaderPrefix_Customer = "/Customer/CustomerService.svc/"
let RequestHeaderPrefix_Contract = "/Contract/ContractService.svc/"
let RequestHeaderPrefix_OrgService = "/Organization/OrgService.svc/"



///MARK:General
///登录
let GeneralLogin_API = RequestRequestHeaderPrefix_General + "GeneralLogin"
///用户权限
let GetUserRole_API = RequestRequestHeaderPrefix_General + "GetUserRole"

///MARK:WorkflowService
///未完成任务
let FlowSelectWaitHandleCount_API = RequestRequestHeaderPrefix_WorkflowService + "FlowSelectWaitHandleCount"
/// 流程信息
let SelectFlowLogDetail_API = RequestRequestHeaderPrefix_WorkflowService + "SelectFlowLogDetail"
/// 未完成任务
let FlowWaitHandleSelect_API = RequestRequestHeaderPrefix_WorkflowService + "FlowWaitHandleSelect"
/// 已完成任务
let FlowHandledSelect_API = RequestRequestHeaderPrefix_WorkflowService + "FlowHandledSelect"
/// 我的流程
let SelectMyFlowLog_API = RequestRequestHeaderPrefix_WorkflowService + "SelectMyFlowLog"



/// MARK:Site
///待整改
let SelectMyAcptCount_API = RequestHeaderPrefix_Site + "SelectMyAcptCount"
///待验收
let SelectMyRectifyCount_API = RequestHeaderPrefix_Site + "SelectMyRectifyCount"
///材料验收/验收单  采购单列表
let SelectMatlPurs_API = RequestHeaderPrefix_Site + "SelectMatlPurs"
/// 查询开工验收申请
let SelectStartWorkAcptList_API = RequestHeaderPrefix_Site + "SelectStartWorkAcptList"
/// 工地验收单
let SelectMyAcpt_API = RequestHeaderPrefix_Site + "SelectMyAcpt"
let SelectMySite_API = RequestHeaderPrefix_Site + "SelectMySite"




/// MARK:MyWorkService
///最新通知
let NoticeCount_API = RequestHeaderPrefix_MyWorkService + "NoticeCount"
///记事本
let SelectNewstNotepad_API = RequestHeaderPrefix_MyWorkService + "SelectNewstNotepad"
///查询消息数量
let SelectSysMsgCount_API = RequestHeaderPrefix_MyWorkService + "SelectSysMsgCount"
///绑定手机号
let CheckBindPhone_API = RequestHeaderPrefix_MyWorkService + "CheckBindPhone"
///重新绑定
let BindPhoneAddNew_API = RequestHeaderPrefix_MyWorkService + "BindPhoneAddNew"
/// 用户详情
let SelectStaffDetail_API = RequestHeaderPrefix_MyWorkService + "SelectStaffDetail"


///MARK:Customer
/// 见面申请列表（含搜索、不同状态）
let CustMeetMobileList_API = RequestHeaderPrefix_Customer + "CustMeetMobileList"
let MeetCustMobileDetail_API = RequestHeaderPrefix_Customer + "MeetCustMobileDetail"


///MARK:Contract
/// 合同列表 搜索 客户名称/楼盘名称/客户电话
let ContractSelectList_API = RequestHeaderPrefix_Contract + "ContractSelectList"
/// 查询设计合同登记列表
let SelectConContractDesignList_API = RequestHeaderPrefix_Contract + "SelectConContractDesignList"
/// 合同信息
let ContractSelectDetaile_API = RequestHeaderPrefix_Contract + "ContractSelectDetaile"
/// 设计合同详情
let SelectContractDesignSingleDetail_API = RequestHeaderPrefix_Contract + "SelectContractDesignSingleDetail"


//MARK:OrgService
/// 联系人详情
let AddrBookSelectDetail_API = RequestHeaderPrefix_OrgService + "AddrBookSelectDetail"
/// 取消联系人收藏
let AddrBookCancelCollection_API = RequestHeaderPrefix_OrgService + "AddrBookCancelCollection"
/// 添加联系人收藏
let AddrBookAddCollection_API = RequestHeaderPrefix_OrgService + "AddrBookAddCollection"


