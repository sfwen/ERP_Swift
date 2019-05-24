//
//  FourLabelViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/10/24.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftyJSONMappable
import ESPullToRefresh

class FourLabelViewController: BasicTableViewController {
    
    var flowCatg : FlowCatg = .None

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadData() -> Void {
        switch self.flowCatg {
        case .MeetCust:
            self.title = "见面申请"
            self.loadData_MeetCust()
            self.loadRightItem_MeetCust()
            break
        case .Contract:
            self.title = "合同"
            self.loadData_Contract()
        case .ContractDesign:
            self.title = "设计合同"
            self.loadData_ContractDesign()
        case .ConstructAccept:
            self.title = "开工验收申请"
            self.loadData_ConstructAccept()
        case .SiteWaitQc:
            self.title = "工地验收单"
            self.loadData_SiteWaitQc()
        case .MySite:
            self.title = "我的工地"
            self.loadData_MySite()
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "FourLabelCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? FourLabelCell
        if cell == nil {
            cell = FourLabelCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.model = (self.contentArray?.object(at: indexPath.row) as! BasicModel)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.contentArray?.object(at: indexPath.row) as! BasicModel
        
        FlowHelper().toDetlByFlowCatg(self.flowCatg, model.relateID_sf!)
    }

    ///MARK:公共方法
    ///MARK:MeetCust 见面客户
    private func loadData_MeetCust() -> Void {
        var param : [String:Any] = Tools().stringValueDic(self.queryPara.mapString()!)!
        param["PosIDs"] = [currUserInfo.Session.LoginStafPosID]
        
        NetworkHelper.makePostRequest(baseUrl: CustMeetMobileList_API, parameters: ["query" : param as NSObject], needRequestHeader: false, successHandler: { (resp) in
            let CustMeets = resp["CustMeets"].arrayValue
            let arr = CustMeets.map({ (subJSON) -> CustMeetModel in
                let model = CustMeetModel(json: subJSON)
                model.relateID_sf = model.ID
                model.s1 = model.Cust?.CustName
                model.s2 = model.Cust?.CustBldName
                model.s3 = model.DsgnName
                model.s4 = model.CreTime
                return model
            })
            self.handleRequestResult(arr as NSArray)
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }
    
    private func loadRightItem_MeetCust() -> Void {
        let rightItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: nil)
        rightItem.tintColor = UIColor.Color_Text_Orange()
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    ///MARK:Contract 合同
    private func loadData_Contract() -> Void {
        var param : [String:Any] = Tools().stringValueDic(self.queryPara.mapString()!)!
        //目前只是写的固定值
        let currValues = NSMutableArray()
        for i in 1...9 {
            currValues.add((i))
        }
        
        param["ContStates"] = currValues
        NetworkHelper.makePostRequest(baseUrl: ContractSelectList_API, parameters: ["queryPara" : param as NSObject], needRequestHeader: false, successHandler: { (resp) in
            let arr = resp["Contracts"].arrayValue.map({ (subJSON) -> ContractModel in
                let model = ContractModel(json: subJSON)
                model.relateID_sf = model.iD
                model.s1 = model.bldName
                model.s2 = ((model.signDate).substring(toIndex: 10))
                model.s3 = model.custName.componentsJoined(by: ",")
                model.s4 = String(format:"%.2f", model.signAmount) + "元" + " " + (contStateToStr(model.contState))
                return model
            })
            self.handleRequestResult(arr as NSArray)
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }
    
    ///MARK:ContractDesign 设计合同
    private func loadData_ContractDesign() -> Void {
        let param : [String:Any] = Tools().stringValueDic(self.queryPara.mapString()!)!
        NetworkHelper.makePostRequest(baseUrl: SelectConContractDesignList_API, parameters: ["queryParam" : param as NSObject], needRequestHeader: false, successHandler: { (resp) in
            let arr = resp["ContractDesigns"].arrayValue.map({ (subJSON) -> ContractDesignModel in
                let model = ContractDesignModel(json: subJSON)
                model.relateID_sf = model.iD
                model.s1 = model.customerName
                model.s2 = flowStateToStr(model.flowState)
                model.s3 = contractTextContDesignRoyaltyState(model.royaltyState)
                model.s4 = textOffcGoodsAchvState(model.writingAchvState)
                model.s5 = model.remark
                return model
            })
            self.handleRequestResult(arr as NSArray)
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }
    
    ///MARK:ConstructAccept 开工验收申请
    private func loadData_ConstructAccept() -> Void {
        let param : [String:Any] = Tools().stringValueDic(self.queryPara.mapString()!)!
        NetworkHelper.makePostRequest(baseUrl: SelectStartWorkAcptList_API, parameters: ["queryPara" : param as NSObject], needRequestHeader: false, successHandler: { (resp) in
            let arr = resp["StartWorkAcpts"].arrayValue.map({ (subJSON) -> SiteModel in
                let model = SiteModel(json: subJSON)
                model.relateID_sf = model.ID
                model.s1 = model.Address
                model.s2 = finSettleStateToStr(model.State!)
                model.s3 = "申请人：" + model.AppSpName!
                model.s4 = "预约时间：" + (model.OrderTime?.substring(toIndex: 16))!
                model.s5 = "备注：" + model.Remark!
                return model
            })
            self.handleRequestResult(arr as NSArray)
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }
    
    /// MARK:工地验收单
    private func loadData_SiteWaitQc() -> Void {
        let param : [String:Any] = Tools().stringValueDic(self.queryPara.mapString()!)!
        NetworkHelper.makePostRequest(baseUrl: SelectMyAcpt_API, parameters: ["queryPara" : param as NSObject], needRequestHeader: false, successHandler: { (resp) in
            let arr = resp["SiteAcpts"].arrayValue.map({ (subJSON) -> SiteAcptModel in
                let model = SiteAcptModel(json: subJSON)
                model.relateID_sf = model.ID
                model.s1 = model.ContAddr
                model.s2 = siteAcptStateToStr(model.State!)
                model.s3 = model.projNameText
                model.s4 = (model.OrderTime?.substring(toIndex: 10))!
                return model
            })
            self.handleRequestResult(arr as NSArray)
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }
    
    /// MARK:我的工地
    private func loadData_MySite() -> Void {
        let param : [String:Any] = Tools().stringValueDic(self.queryPara.mapString()!)!
        NetworkHelper.makePostRequest(baseUrl: SelectMySite_API, parameters: ["queryPara" : param as NSObject], needRequestHeader: false, successHandler: { (resp) in
            let arr = resp["Sites"].arrayValue.map({ (subJSON) -> SiteModel in
                let model = SiteModel(json: subJSON)
                model.relateID_sf = model.ID
                model.s1 = model.Addr
                model.s2 = contStateToStr(model.SiteState!)
//                let str : String = model.CustTels!.componentsJoined(by: ",")
                model.s3 = model.CustName! + "  " + model.CustTels!.componentsJoined(by: ",")
                model.s4 = (model.OrderTime?.substring(toIndex: 10))!
                return model
            })
            self.handleRequestResult(arr as NSArray)
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }
    
}
