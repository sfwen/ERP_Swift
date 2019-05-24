//
//  OptionModel.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/23.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

//public init?(rawValue: -100)

enum FlowCatg : Int {
    case None = 0
    /// 见面客户
    case MeetCust = 1
    /// 合同
    case Contract = 2
    /// 请假单
    case Leave = 3
    /// 外出单
    case Egress = 4
    /// 开工申请单
    case ContStart = 5
    /// 工地用料单
    case MatlNeed = 6
    /// 工地整改单
    case SiteRectify = 7
    /// 办公用品申领
    case OffcGoodsApply = 8
    /// 停工登记
    case SiteStopRst = 9
    ///工地完工登记
    case SiteCmpl = 10
    /// 供应商活动
    case SupplierAct = 11
    /// 员工奖惩单
    case RwdPuh = 12
    /// 供应商奖惩单
    case RwdPuhSupplier = 13
    /// 材料结算单
    case MatlSettle = 14
    /// 工作联系单
    case Liaison = 15
    /// 员工账户变更
    case StaffAcctChg = 16
    /// 员工入职申请
    case StaffEntry = 17
    /// 员工转正申请
    case StaffBecome = 18
    /// 员工异动申请
    case StaffTran = 19
    /// 员工离职申请
    case StaffQuit = 20
    /// 人员需求申请
    case StaffNeed = 21
    /// 其他报销单（目前发现这个枚举没用）
    case FinReimburse = 22
    /// 变更设计师
    case ChangeDesiner = 23
    /// 定金登记
    case Earnest = 24
    /// 定金退款
    case EarnestRefund = 25
    /// 部门奖励基金申请
    case DeptFundApply = 26
    /// 部门基金使用申请
    case DeptFundUseApply = 27
    /// 报销申请单
    case FinSettleOtherOut = 28
    /// 其他收款单
    case FinSettleOtherIn = 29
    /// 验房退款申请单
    case CheckHouseRefund = 30
    /// 验房申请单
    case CheckHouse = 31
    /// 批量员工奖惩单
    case RwdPuhBatch = 32
    /// 售后费用收款单
    case AfterSaleInSettle = 33
    /// 请款单
    case RequestBill = 34
    /// 售后费用付款单
    case AfterSalePaySettle = 35
    /// 合同退单登记
    case ContRefund = 36
    /// 薪资确认单
    case SalaryConfirm = 37
    /// 客服派单
    case CustAssign = 39
    /// 水电增项单
    case ContHydropower = 40
    /// 客户推广费用申请
    case CustPromCost = 41
    /// 提成发放单
    case SalaryRoyalty = 42
    /// 客户推广费用报销
    case CustPromReimburse = 43
    /// 会议室申请
    case BoardroomApply = 44
    /// 押金收/退款单申请
    case FinDeposit = 45
    /// 薪资特殊调整单
    case SalAdjust = 46
    /// 公积金购买申请
    case HouseFundBuy = 47
    /// 社保购买申请
    case SocialSecurityBuy = 48
    /// 员工奖金单申请
    case SalBonusApply = 49
    /// 调休申请单
    case OffLeave = 50
    /// "维修基金收款单"),
    case RepairFundIn = 51
    /// "维修基金退款单"),
    case RepairFundOut = 52
    /// "借支申请单"),
    case FinBorrow = 53
    /// "合同优惠单"),
    case ContDiscount = 54
    /// "发包发放单"),
    case BaseMoneyPay = 55
    /// "借贷申请单"),
    case FinLoan = 56
    /// "供应商采购预付单"),
    case MatlPrePay = 57
    /// "水电增项变更单"),
    case ContHydrChg = 58
    /// "工人发包发放申请"),
    case WorkerCostPayApply = 59
    /// "工人工资发放单"),
    case WorkerCostPay = 60
    /// "业绩调整单"),
    case AchvAdjust = 61
    /// "产品价格变更单"),重复了
    //    case MatlPriceChg = 62
    /// "供应商活动参与申请单"
    case SupplierActApply = 63
    /// "产品销售单"
    case OffcGoodsSale = 64
    /// "材料产品批量设置申请单"
    case OffcGoodsBatch = 65
    /// "家具家电批量设置申请单"
    case FitAppsBatch = 66
    /// "发包单"
    case BaseMoney = 67
    /// "项目提成单"
    case RoyaltyChk = 68
    ///"公司承担费用申请"
    case CoBearCost = 69
    
    /// "产品销售提成单"),
    case OffcGoodsRoyalty = 70
    /// "员工罚款单"),
    case StaffPuh = 71
    /// "员工奖励单"),
    case StaffRwd = 72
    /// "批量员工奖励单"),
    case StaffRwdBatch = 73
    /// "批量员工罚款单"),
    case StaffPuhBatch = 74
    /// "项目增减单"),
    case IncrDecrChg = 75
    /// "核算变更单"),
    case MatlChkChg = 76
    /// "项目经理押金退款单"),
    case ProjMgrDepositOut = 77
    /// "供应商押金退款单"),
    case SupplierDepositOut = 78
    /// "提成决算单"),
    case RoyaltyFinalChk = 79
    /// "材料采购单"),
    case MatlPur = 80
    /// "工地项目设置"),
    case SiteProj = 81
    /// "物资采购入库单"),
    case GoodsSettle = 82
    /// "家具家电采购结算单"),
    case FitAppsPurSettle = 83
    /// "合同收款单"),
    case ContractReceive = 84
    /// "核算单")
    case MatlChk = 85
    /// "部门基金收款单"),
    case FundPayIn = 86
    /// "项目经理押金收款单"),
    case ProjMgrDepositIn = 87
    /// "供应商押金收款单"),
    case SupplierDepositIn = 88
    /// "优惠券登记"),
    case CouponPur = 89
    /// "优惠券退款"),
    case CouponRefund = 90
    /// "供应商配合费"),
    case SupplierRebateMoney = 91
    /// "办公用品"),
    case Office = 92
    /// "软装饰品"),
    case Ornament = 93
    /// "材料产品"),
    case MatlProd = 94
    /// "家具家电产品"),
    case FitAppsProd = 95
    /// "员工工资单"),
    case SalPayroll = 96
    /// "借支还款单"),
    case FinBorrowRepay = 97
    /// "基装报价单"),
    case OfferBaseInst = 100
    /// "套餐报价单"),
    case OfferPkg = 101
    /// "一口价报价单"),
    case OfferFixed = 102
    /// "整装报价单"),
    case OfferFull = 103
    /// "V+整装报价单"),
    case OfferFullV = 104
    /// "借贷还款单"),
    case FinLoanRepay = 105
    /// "合同协作单"),
    case ClashCont = 106
    /// "产品零售增减单"),
    case OffcGoodsSaleExtend = 107
    /// "材料产品价格变更单"),
    case MatlPriceChg = 109
    /// "软装产品价格变更单"),
    case FitAppsPriceChg = 110
    /// "合同清算登记"),
    case ContLiquidation = 111
    /// "核算单明细"),
    case MatlChkDetl = 112
    /// "增减单明细"),
    case IncrDecrChgDetl = 113
    /// "核算变更明细"),
    case MatlChkChgDetl = 114
    /// "产品零售收款单"),
    case OffcGoodsSaleSettle = 115
    /// "记事本")
    case Notepad = 116
    /// 物资领用单
    case OffcSiteUse = 118
    /// 开工日期变更单
    case StartDateChg = 135
    /// 装修管家变更
    case SitePersonChg = 139
    /// 工地计划"),
    case SitePlan = 140
    /// 签单回访"),
    case VisitSign = 141
    /// 美工任务单"),
    case ArtTask = 142
    /// 基装报价项价格变更"),
    case OfferItemBaseInstPriceChg = 143
    /// 有效简历申报"),
    case ValidResumeReport = 144
    /// 电话费用登记"),
    case TelFee = 147
    /// 合同设计师变更"),
    case ContDsgnChg = 148
    /// 主材确认单"),
    case MatlConfirm = 149
    /// 主材通知单"),
    case MatlPurConfirm = 150
    /// 物资归还"),
    case OffcGoodsReturn = 151
    /// 公司补贴抵扣单"),
    case DeductSubsidyMoney = 152
    /// 内部转款单"),
    case FinInternal = 153
    /// 主材确认单明细"),
    case MatlConfirmDetl = 154
    /// 报价项明细"),
    case OfferItemDetl = 155
    /// 供应商预付款账户"),
    case SupPreAcct = 156
    /// 供应商预付退款单"),
    case MatlPrePayRefund = 157
    /// 装修管家押金"),
    case DepositManager = 158
    /// 供应商押金"),
    case DepositSupplier = 159
    /// 核算明细变更明细"),
    case MatlChkDetlChg = 160
    /// "签单客户验房登记"),
    case SignContCustCheckHouse = 161
    /// 工地巡检"),
    case SiteInspection = 162
    /// 员工绑定手机变更"),
    case ChangeBindPhone = 163
    /// 回访满意度评价"),
    case VisitEvaluate = 164
    /// 考核提成点设置"),
    case RewardRatioTempSet = 165
    /// 其他付款单"),
    case FinSettleOtherHisOut = 166
    /// 工地费用报销单
    case FinSettleOtherSiteOut = 167
    ///  部门基金扣款单
    case FundDeduct = 168
    /// 现场活动优惠登记
    case LiveActivity = 169
    /// 物资零售单
    case OffcRetail = 170
    /// 基装材料通知单
    case MatlPurBaseConfirm = 171
    /// 合同预算员变更
    case BudgetChg = 172
    /// 工人发包单
    case BaseMoneyWorker = 173
    /// 考核提成点
    case SrAssPushProportionStfMonth = 174
    /// 主材报价项价格变更
    case OfferItemMatlPriceChg = 175
    /// 杂费报价项价格变更
    case OfferItemFeesPriceChg = 176
    /// 远程费报价项价格变更
    case OfferItemRemotePriceChg = 177
    /// 员工罚款取消单
    case StaffPuhCancel = 178
    /// 员工奖励取消单
    case StaffRwdCancel = 179
    /// 维修基金转账单
    case RepairFundTrans = 180
    /// 复工登记
    case SiteRst = 181
    /// 设计合同
    case ContractDesign = 184
    /// 设计合同登记提成单
    case ContractDesignRoyalty = 185
    /// 工程部经理变更
    case ContChgPMDptMgr = 187
    /// 员工扣款单
    case StaffDebit = 188
    /// 员工扣款单申请
    case StaffDebitBatch = 189
    /// 售后延期登记
    case WarrantyCardDelay = 190
    /// 完工作品评定登记
    case SiteCmplRank = 192
    /// 开工验收申请
    case ConstructAccept = 199
    /// 员工扣款取消单
    case DebitPuhCancel = 201
    /// 测量通知单
    case NoticeMeasure = 205
    /// 安装通知单
    case NoticeInstall = 206
    /// 工地工期调整单
    case SiteTimeLimitAdjust = 208
    /// 库存调拨单
    case StockAllocation = 209
    /// 开工确认单
    case StartWorkConfirm = 211
    /// 部门基金转账单
    case DeptFundTransfer = 212
    
    ///MARK:自定义
    ///工地验收单
    case SiteWaitQc = 800
    ///工地
    case MySite
    /// 值班安排记录
    case DutySchedule = 1000
    /// 回访
    case VisitCustomer = 1001
}

enum FlowStateType : Int {
    ///新建
    case None = 0
    ///待提交
    case WaitStart = 1
    ///进行中
    case InFlow
    ///已完成
    case Finished
    ///已打回
    case Backed
    ///已中止
    case Aborted
}

class OptionModel: NSObject {
    var name : String?
    var tag : Int?
    var imageName : String?
    var flowCatg : FlowCatg? = .none
}

func flowStateToStr(_ flowState : FlowStateType) -> String {
    var str = ""
    switch flowState {
    case .None:
        str = "新建"
    case .WaitStart:
        str = "待传递"
    case .InFlow:
        str = "进行中"
    case .Finished:
        str = "已完成"
    case .Backed:
        str = "已打回"
    case .Aborted:
        str = "已中止"
    }
    return str
}

func flowCatgToStr(_ flowCatg : FlowCatg) -> String {
    var str = ""
    switch flowCatg {
    case .MeetCust:
        str = "见面客户"
    case .Contract:
        str = "合同"
    case .Leave:
        str = "请假单"
    case .Egress:
        str = "外出单"
    case .ContStart:
        str = "开工申请单"
    case .MatlNeed:
        str = "工地用料单"
    case .SiteRectify:
        str = "工地整改单"
    case .OffcGoodsApply:
        str = "办公用品申领"
    case .SiteStopRst:
        str = "停工登记"
    case .SiteCmpl:
        str = "工地完工登记"
    case .SupplierAct:
        str = "供应商活动"
    case .RwdPuh:
        str = "员工奖惩单"
    case .RwdPuhSupplier:
        str = "供应商奖惩单"
    case .MatlSettle:
        str = "采购结算单"
    case .Liaison:
        str = "工作联络单"
    case .StaffAcctChg:
        str = "员工账户变更"
    ///员工入职申请
    case .StaffEntry:
        str = "员工入职申请"
    ///员工转正申请
    case .StaffBecome:
        str = "员工转正申请"
    ///员工异动申请
    case .StaffTran:
        str = "员工异动申请"
    ///员工离职申请
    case .StaffQuit:
        str = "员工离职申请"
    ///人员需求申请
    case .StaffNeed:
        str = "人员需求申请"
    ///变更设计师
    case .ChangeDesiner:
        str = "变更设计师"
    /// 定金登记
    case .Earnest:
        str = "定金登记"// = 24,
    /// 定金退款
    case .EarnestRefund:
        str = "定金退款"// 25,
    /// 部门奖励基金申请
    case .DeptFundApply:
        str = "部门奖励基金申请"// 26,
    /// 部门基金使用申请
    case .DeptFundUseApply:
        str = "部门基金使用申请"
    /// 报销申请单
    case .FinSettleOtherOut:
        str = "报销申请单"
    /// 其他收款单
    case .FinSettleOtherIn:
        str = "其他收款单"
    /// 验房退款申请单
    case .CheckHouseRefund:
        str = "验房退款申请单"
    /// 验房申请单
    case .CheckHouse:
        str = "验房申请单"
    /// 批量员工奖惩单
    case .RwdPuhBatch:
        str = "批量员工奖惩单"
    case .AfterSaleInSettle:
        str = "售后费用收款单"
    case .RequestBill:
        str = "请款单"
    case .AfterSalePaySettle:
        str = "售后费用付款单"
    case .ContRefund:
        str = "合同退单登记"
    case .SalaryConfirm:
        str = "薪资确认单"
    case .CustAssign:
        str = "客服派单"
    case .ContHydropower:
        str = "水电增项单"
    case .CustPromCost:
        str = "客户推广费用申请"
    case .SalaryRoyalty:
        str = "提成发放单"
    case .CustPromReimburse:
        str = "客户推广费用报销"
    case .BoardroomApply:
        str = "会议室申请"
    case .FinDeposit:
        str = "押金收/退款单申请"
    case .SalAdjust:
        str = "薪资特殊调整单"
    case .HouseFundBuy:
        str = "公积金购买申请"
    case .SocialSecurityBuy:
        str = "社保购买申请"
    case .SalBonusApply:
        str = "员工奖金单申请"
    case .OffLeave:
        str = "调休申请单"
    case .RepairFundIn:
        str = "维修基金收款单"
    case .RepairFundOut:
        str = "维修基金退款单"
    case .FinBorrow:
        str = "借支申请单"
    case .ContDiscount:
        str = "合同优惠单"
    case .BaseMoneyPay:
        str = "发包发放单"
    case .FinLoan:
        str = "借贷申请单"
    case .MatlPrePay:
        str = "供应商采购预付单"
    case .ContHydrChg:
        str = "水电增项变更单"
    case .WorkerCostPayApply:
        str = "工人发包发放申请"
    case .WorkerCostPay:
        str = "工人工资发放单"
    case .AchvAdjust:
        str = "业绩调整单"
    case .SupplierActApply:
        str = "供应商活动参与申请单"
    case .OffcGoodsSale:
        str = "产品零售单"
    case .OffcGoodsBatch:
        str = "材料产品批量设置申请单"
    case .FitAppsBatch:
        str = "家具家电批量设置申请单"
    case .BaseMoney:
        str = "发包单"
    case .RoyaltyChk:
        str = "项目提成单"
    case .CoBearCost:
        str = "公司承担费用申请"
    case .OffcGoodsRoyalty:
        str = "产品销售提成单"
    case .StaffPuh:
        str = "员工罚款单"
    case .StaffRwd:
        str = "员工奖励单"
    case .StaffRwdBatch:
        str = "批量员工奖励单"
    case .StaffPuhBatch:
        str = "批量员工罚款单"
    case .IncrDecrChg:
        str = "项目增减单"
    case .MatlChkChg:
        str = "核算变更单"
    case .ProjMgrDepositOut:
        str = "项目经理押金退款单"
    case .SupplierDepositOut:
        str = "供应商押金退款单"
    case .RoyaltyFinalChk:
        str = "提成决算单"
    case .MatlPur:
        str = "采购单"
    case .SiteProj:
        str = "工地项目设置"
    case .GoodsSettle:
        str = "物资采购入库单"
    case .FitAppsPurSettle:
        str = "家具家电采购结算单"
    case .ContractReceive:
        str = "合同收款单"
    case .MatlChk :
        str = "核算单"
    case .FundPayIn :
        str = "部门基金收款单"
    case .ProjMgrDepositIn:
        str = "项目经理押金收款单"
    case .SupplierDepositIn :
        str = "供应商押金收款单"
    case .CouponPur:
        str = "优惠券登记"
    case .CouponRefund :
        str = "优惠券退款"
    case .SupplierRebateMoney:
        str = "供应商配合费"
    case .Office :
        str = "办公用品"
    case .Ornament:
        str = "软装饰品"
    case .MatlProd:
        str = "材料产品"
    case .FitAppsProd:
        str = "家具家电产品"
    case .SalPayroll :
        str = "员工工资单"
    case .FinBorrowRepay:
        str = "借支还款单"
    case .OfferBaseInst:
        str = "基装报价单"
    case .OfferPkg :
        str = "套餐报价单"
    case .OfferFixed:
        str = "一口价报价单"
    case .OfferFull:
        str = "整装报价单"
    case .OfferFullV :
        str = "V+整装报价单"
    case .FinLoanRepay:
        str = "借贷还款单"
    case .ClashCont:
        str = "合同协作单"
    case .OffcGoodsSaleExtend:
        str = "产品零售增减单"
    case .MatlPriceChg:
        str = "材料产品价格变更单"
    case .FitAppsPriceChg :
        str = "软装产品价格变更单"
    case .ContLiquidation:
        str = "合同清算登记"
    case .MatlChkDetl:
        str = "核算单明细"
    case .IncrDecrChgDetl:
        str = "增减单明细"
    case .MatlChkChgDetl:
        str = "核算变更明细"
    case .OffcGoodsSaleSettle:
        str = "产品零售收款单"
    //        case .Notepad:str = "记事本"
    case .StartDateChg:
        str = "开工日期变更单"
    case .SitePersonChg:
        str = "工地人员变更"
    case .SitePlan:
        str = "工地计划"
    case .VisitSign:
        str = "签单回访"
    case .ArtTask:
        str = "美工任务单"
    case .OfferItemBaseInstPriceChg:
        str = "基装报价项价格变更"
    case .ValidResumeReport:
        str = "有效简历申报"
    case .TelFee:
        str = "电话费用登记"
    case .ContDsgnChg:
        str = "合同设计师变更"
    case .MatlConfirm:
        str = "主材确认单"
    case .MatlPurConfirm:
        str = "主材通知单"
    case .OffcGoodsReturn:
        str = "物资归还"
    case .DeductSubsidyMoney:
        str = "公司补贴抵扣单"
    case .FinInternal:
        str = "内部转款单"
    case .MatlConfirmDetl:
        str = "主材确认单明细"
    case .OfferItemDetl:
        str = "报价项明细"
    case .SupPreAcct:
        str = "供应商预付款账户"
    case .MatlPrePayRefund:
        str = "供应商预付退款单"
    case .DepositManager:
        str = "装修管家押金"
    case .DepositSupplier:
        str = "供应商押金"
    case .MatlChkDetlChg:
        str = "核算明细变更明细"
    case .SignContCustCheckHouse:
        str = "签单客户验房登记"
    case .SiteInspection:
        str = "工地巡检"
    case .ChangeBindPhone:
        str = "员工绑定手机变更"
    case .VisitEvaluate:
        str = "回访满意度评价"
    case .RewardRatioTempSet:
        str = "考核提成点设置"
    case .FinSettleOtherHisOut:
        str = "其他付款单"
    case .FinSettleOtherSiteOut:
        str = "工地费用报销单"
    case .FundDeduct:
        str = "部门基金扣款单"
    case .LiveActivity:
        str = "现场活动优惠登记"
    case .OffcRetail:
        str = "物资零售单"
    case .MatlPurBaseConfirm:
        str = "基装材料通知单"
    case .BudgetChg:
        str = "合同预算员变更"
    case .BaseMoneyWorker:
        str = "工人发包单"
    case .SrAssPushProportionStfMonth:
        str = "考核提成点"
    case .OfferItemMatlPriceChg:
        str = "主材报价项价格变更"
    case .OfferItemFeesPriceChg:
        str = "杂费报价项价格变更"
    case .OfferItemRemotePriceChg:
        str = "远程费报价项价格变更"
    case .StaffPuhCancel:
        str = "员工罚款取消单"
    case .StaffRwdCancel:
        str = "员工奖励取消单"
    case .RepairFundTrans:
        str = "维修基金转账单"
    case .SiteRst:
        str = "复工登记"
    case .ContractDesign:
        str = "设计合同登记"
    case .ContractDesignRoyalty:
        str = "设计合同登记提成单"
    case .StaffDebit:
        str = "员工扣款单"
    case .StaffDebitBatch:
        str = "员工扣款单申请"
    case .WarrantyCardDelay:
        str = "售后延期登记"
    case .SiteCmplRank:
        str = "完工作品评定登记"
    case .ConstructAccept:
        str = "开工验收申请"
    case .ContChgPMDptMgr:
        str = "工程部经理变更单"
    case .NoticeMeasure:
        str = "测量通知单"
    case .NoticeInstall:
        str = "安装通知单"
    case .DebitPuhCancel:
        str = "员工扣款取消单"
    case .OffcSiteUse:
        str = "物资领用单"
    case .SiteTimeLimitAdjust:
        str = "工地工期调整单"
    case .StockAllocation:
        str = "库存调拨单"
    case .StartWorkConfirm:
        str = "开工确认单"
    case .DeptFundTransfer:
        str = "部门基金转账单"
    default:()
        str = ""
    }
    return str
}
