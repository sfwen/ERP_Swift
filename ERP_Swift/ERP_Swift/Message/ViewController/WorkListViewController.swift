//
//  WorkListViewController.swift
//  ERP_Swift
//
//  Created by Land on 2018/11/20.
//  Copyright © 2018年 Land. All rights reserved.
//

import UIKit
import SwiftyJSON

enum WorkListCtrlType : Int {
    case none
    ///我的未处理
    case MyUndo
    ///全部未处理
    case AllUndo
    /// 已处理
    case MyDone
}

class WorkListViewController: FourLabelViewController, SliderViewContainerDelegate {
    func reloadView() {
        
    }

    
    var workListCtrlType : WorkListCtrlType = .none
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func loadData() {
        self.title = ""
        switch self.workListCtrlType {
        case .MyDone:
            //
            self.title = "已完成任务"
            self.loadData_HasFinishedWork()
        case .MyUndo:
            self.loadData_UntreatedWork("WaitHandleCatg", 1)
        case .AllUndo:
            self.loadData_UntreatedWork("WaitHandleCatg", 2)
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func handleResultData(_ resp : JSON) -> Void {
        let arr = resp["NodeLogs"].arrayValue.map({ (subJSON) -> FlowLogModel in
            let model = FlowLogModel(json: subJSON)
            model.relateID_sf = model.iD
            model.s1 = flowCatgToStr(model.flowCatg)
            model.s2 = ((model.creTime).substring(toIndex: 16))
            model.s3 = model.nodeName
            var str = ""
            if model.urgency == .Normal {
                str = "   " + flowStateToStr(model.logState)
            } else {
                str = "   " + flowUrgencyToStr(model.urgency) + "   " + flowStateToStr(model.logState)
            }
            model.s4 = model.isCopy ? "通知" : "流程"
            model.s4 = model.s4! + str
            return model
        })
        self.handleRequestResult(arr as NSArray)
    }
    
    private func loadData_UntreatedWork(_ key : String, _ value : Int) -> Void {
        var param : [String:Any] = Tools().stringValueDic(self.queryPara.mapString()!)!
        param[key] = NSNumber.init(value: value)
        
        NetworkHelper.makePostRequest(baseUrl: FlowWaitHandleSelect_API, parameters: ["queryPara" : param as NSObject], needRequestHeader: false, successHandler: { (resp) in
            self.handleResultData(resp)
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }
    
    private func loadData_HasFinishedWork() -> Void {
        let param : [String:Any] = Tools().stringValueDic(self.queryPara.mapString()!)!
        
        NetworkHelper.makePostRequest(baseUrl: FlowHandledSelect_API, parameters: ["queryPara" : param as NSObject], needRequestHeader: false, successHandler: { (resp) in
            self.handleResultData(resp)
        }, errorMsgHandler: { (error) in
            print("1\t" + error)
        }) { (error) in
            print(error)
        }
    }

}
