//
//  MyWorkFlowListViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/20.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON

class MyWorkFlowListViewController: BasicTableViewController {

    override func viewDidLoad() {
        self.isHiddenListHeaderView = true
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func loadData() {
        self.title = "我的流程"
        
        let param : [String:Any] = Tools().stringValueDic(self.queryPara.mapString()!)!
        
        NetworkHelper.makePostRequest(baseUrl: SelectMyFlowLog_API, parameters: ["queryPara" : param as NSObject], needRequestHeader: false, successHandler: { (resp) in
            print(resp)
            let arr = resp["Logs"].arrayValue.map({ (subJSON) -> FlowLogModel in
                let model = FlowLogModel(json: subJSON)
                model.relateID_sf = model.iD
                model.s1 = flowCatgToStr(model.flowCatg)
                model.s2 = flowStateToStr(FlowStateType(rawValue: model.state)!)
                model.s3 = ((model.creTime).substring(toIndex: 16))
                
                return model
            })
            self.handleRequestResult(arr as NSArray)
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "WorkFlowCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? WorkFlowCell
        if cell == nil {
            cell = WorkFlowCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.model = self.contentArray?.object(at: indexPath.row) as? BasicModel
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
