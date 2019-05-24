//
//  GeneralDetailViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/8.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit

class GeneralDetailViewController: BasicDetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.loadData()
        self.addProgressVC()
        self.addRightMoreItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() -> Void {
        switch self.catg {
        case .MeetCust:
            self.title = "见面申请"
            self.loadData_MeetCust()
        case .Contract:
            self.title = "合同信息"
            self.showMore = true
            self.loadData_Contract()
        case .ContractDesign:
            self.title = "设计合同"
            self.showMore = true
            self.loadData_ContractDesign()
        case .ConstructAccept:
            self.title = "开工验收申请"
//            self.loadData_ConstructAccept()
        case .SiteWaitQc:
            self.title = "工地验收单"
//            self.loadData_SiteWaitQc()
        case .MySite:
            self.title = "我的工地"
//            self.loadData_MySite()
        default:
            break
        }
    }
    
    /// MARK:见面申请
    func loadData_MeetCust() -> Void {
        NetworkHelper.makePostRequest(baseUrl: MeetCustMobileDetail_API, parameters: ["meetCustID" : self.relateID! as NSObject], needRequestHeader: false, successHandler: { (resp) in
            print(resp)
            let custMeetModel = CustMeetModel.init(json: resp["CustMeet"])
            self.nameLabel.text = custMeetModel.Cust?.CustBldName
            self.phoneLabel.text = (custMeetModel.Cust?.CustName)! + (custMeetModel.Cust?.CustContactWays?.componentsJoined(by: ","))!
            self.contentArray = custMeetModel.getBasicInfoArray()
            self.tableView?.reloadData()
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    
    /// MARK:合同信息
    func loadData_Contract() -> Void {
        NetworkHelper.makePostRequest(baseUrl: ContractSelectDetaile_API, parameters: ["contID" : self.relateID! as NSObject], needRequestHeader: false, successHandler: { (resp) in
            let model = ContractModel.init(json: resp["Contract"])
            self.nameLabel.text = model.bldName
            self.phoneLabel.text = model.custName.componentsJoined(by: ",") + model.custTel.componentsJoined(by: ",")
            self.contentArray = model.getBasicInfoArray()
            self.tableView?.reloadData()
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }
    
    /// MARK:设计合同详情
    func loadData_ContractDesign() -> Void {
        NetworkHelper.makePostRequest(baseUrl: SelectContractDesignSingleDetail_API, parameters: ["contID" : self.relateID! as NSObject], needRequestHeader: false, successHandler: { (resp) in
            print(resp.stringValue)
            let model = ContractDesignModel.init(json: resp["contractDesign"])
            self.nameLabel.text = model.customerName
            self.phoneLabel.text = model.customerTel
            self.contentArray = model.getBasicInfoArray()
            self.tableView?.reloadData()
        }, errorMsgHandler: { (error) in
            
        }) { (error) in
            
        }
    }

}
